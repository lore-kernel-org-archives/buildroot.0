From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 20 Oct 2011 21:45:35 +0200
Subject: [Buildroot] [PATCH] -lsof was unable to patch Makefile.skel due
	to bad file permissions. Adding chmod solves it. (openSUSE)
In-Reply-To: <201110201448.53060.arnout@mind.be>
References: <1319057745-31257-1-git-send-email-damian@veritymedical.co.uk>
 <201110201322.13259.yann.morin.1998@anciens.enib.fr>
 <201110201448.53060.arnout@mind.be>
Message-ID: <201110202145.36062.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Thursday 20 October 2011 14:48:52 Arnout Vandecappelle wrote:
> On Thursday 20 October 2011 13:22:13, Yann E. MORIN wrote:
> > > LSOF_EXTRACT_CMDS = \
> > >         $(INFLATE.bz2) $(DL_DIR)/$(LSOF_SOURCE) | \
> > >               $(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
> > >         $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -)
> > 
> > That would not work, because the first $(TAR) will extract actual files
> > to the disk, and does not send the extracted files to the stdio, so the
> > second $(TAR) will get nothing on its stdin (at best), or only get
> > garbage (at worst).
> 
>  Oh, is -O not a universally accepted tar option?

Ah. Sigh... I missed that '-O' option... My bad.

You're right, that would work.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
