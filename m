From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Jan 2017 10:01:41 +0100
Subject: [Buildroot] make menuconfig problem in latest snapshot
In-Reply-To: <20170118175332.60e7a690@free-electrons.com>
References: <c7623806-1a06-8500-af10-e94601258f79@lamiaworks.com.au>
 <20170118175332.60e7a690@free-electrons.com>
Message-ID: <20170121090141.GA3623@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, scsijon, All,

On 2017-01-18 17:53 +1100, Thomas Petazzoni spake thusly:
> On Wed, 18 Jan 2017 12:55:49 +1100, scsijon wrote:
> > Found this error in todays snapshot
> > --------------------------
> > # make menuconfig
> > support/scripts/br2-external: line 111: syntax error near unexpected 
> > token `"${br2_name}"'
> > Makefile:197: 
> > /initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/.br-external.mk: 
> > No such file or directory
> > make: Failed to remake makefile 
> > `/initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/.br-external.mk'.
> > support/scripts/br2-external: line 111: syntax error near unexpected 
> > token `"${br2_name}"'
> > make: *** 
> > [/initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/build/.br2-external.in] 
> > Error 2
> > #
> > ----------------------------
> 
> Thanks for the report! Can you try reverting commit
> 05576fca13b129da8c7186ee2307981135d3391f ? I believe it's the one that
> introduced the problem.
> 
> Yann, are you sure that the nested double quotes are OK?

Yes, they are OK. Besides, line 111 is not the one that was changed in
that commit. Line 111 is:

    BR2_EXT_NAMES+=( "${br2_name}" )

Regards,
Yann E. MORIN.

> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
