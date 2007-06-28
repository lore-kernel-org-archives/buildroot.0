From: Rick Foos <rick@synchromeshcomputing.com>
Date: Thu, 28 Jun 2007 15:48:00 -0500
Subject: [Buildroot] svn commit: trunk/buildroot/package/config: lxdialog
References: <20070628130622.5F0F4A461D@busybox.net>
Message-ID: <08be01c7b9c5$9dedc610$6e02a8c0@k2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was also updating config from earlier. Most of it was the same, but when I 
merged yours into my changes, a few things came up to pass along.

The patch is based on the revision 18967

The lxdialog shell script is added as non-executable. so adding 
svn:executable to the lxdialog shell would be good too.

util.c - .kconfig.d should be .config.cmd
lkc.h - PACKAGE should be buildroot not linux.
lex.zconf.c - line 3 path doesn't exist (scripts/kconfig)
Makefile - fix standalone build, and distclean for mconf
Makefile.kconfig - add else rules to LKC_GENPARSER to regenerate from 
shipped versions.

Rick

----- Original Message ----- 
From: <aldot@uclibc.org>
To: <buildroot@uclibc.org>
Sent: Thursday, June 28, 2007 8:06 AM
Subject: [Buildroot] svn commit: trunk/buildroot/package/config: lxdialog

-------------- next part --------------
A non-text attachment was scrubbed...
Name: config-fixes.patch
Type: application/octet-stream
Size: 2732 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070628/85f53967/attachment.obj 
