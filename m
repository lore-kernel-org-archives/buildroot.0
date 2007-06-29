From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 29 Jun 2007 10:01:15 +0200
Subject: [Buildroot] kconfig [was: Re: svn commit:
	trunk/buildroot/package/config: lxdialog]
In-Reply-To: <08be01c7b9c5$9dedc610$6e02a8c0@k2>
References: <20070628130622.5F0F4A461D@busybox.net>
	<08be01c7b9c5$9dedc610$6e02a8c0@k2>
Message-ID: <20070629080115.GC8033@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 28, 2007 at 03:48:00PM -0500, Rick Foos wrote:
>I was also updating config from earlier. Most of it was the same, but when 
>I merged yours into my changes, a few things came up to pass along.
>
>The patch is based on the revision 18967
>
>The lxdialog shell script is added as non-executable. so adding 
>svn:executable to the lxdialog shell would be good too.

Since we call it via $(shell $(CONFIG_SHELL) ...) it doesn't have to be
executable. Since it is not executable in the kernel it is better not to
rely on it being executable to avoid surprises if it would be updated
later on.

>
>util.c - .kconfig.d should be .config.cmd

What does this solve?

>lkc.h - PACKAGE should be buildroot not linux.

ok.

>lex.zconf.c - line 3 path doesn't exist (scripts/kconfig)

I don't understand. Please elaborate.

>Makefile - fix standalone build, and distclean for mconf

ok.

>Makefile.kconfig - add else rules to LKC_GENPARSER to regenerate from 

What does this solve? I do not want to touch this file. If the kernel
folks accept such a patch, we can pull it from them.

>shipped versions.
