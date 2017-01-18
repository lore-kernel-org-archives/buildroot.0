From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jan 2017 17:53:32 +1100
Subject: [Buildroot] make menuconfig problem in latest snapshot
In-Reply-To: <c7623806-1a06-8500-af10-e94601258f79@lamiaworks.com.au>
References: <c7623806-1a06-8500-af10-e94601258f79@lamiaworks.com.au>
Message-ID: <20170118175332.60e7a690@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Jan 2017 12:55:49 +1100, scsijon wrote:
> Found this error in todays snapshot
> --------------------------
> # make menuconfig
> support/scripts/br2-external: line 111: syntax error near unexpected 
> token `"${br2_name}"'
> Makefile:197: 
> /initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/.br-external.mk: 
> No such file or directory
> make: Failed to remake makefile 
> `/initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/.br-external.mk'.
> support/scripts/br2-external: line 111: syntax error near unexpected 
> token `"${br2_name}"'
> make: *** 
> [/initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/build/.br2-external.in] 
> Error 2
> #
> ----------------------------

Thanks for the report! Can you try reverting commit
05576fca13b129da8c7186ee2307981135d3391f ? I believe it's the one that
introduced the problem.

Yann, are you sure that the nested double quotes are OK?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
