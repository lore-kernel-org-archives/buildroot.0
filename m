From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Mon, 27 Oct 2008 21:42:42 +0100
Subject: [Buildroot] [PATCH] Avoid make distclean to remove packages
	fromrootfs
In-Reply-To: <COL0-DAV311F354B4DDD6CF6B394418D290@phx.gbl>
References: <e4c675870810220506q31952b43ta544bfbdcec64c4e@mail.gmail.com>
	<COL0-DAV311F354B4DDD6CF6B394418D290@phx.gbl>
Message-ID: <e4c675870810271342l7cb8d57eo824d1238bcf18ab3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/22 John Schimandle <john_schimandle@hotmail.com>:
> I perform the following steps to rebuild the rootfs. It's fast and easy.
>
> rm project_build_ARCH/PROJECT/.root
> rm -rf project_build_ARCH/PROJECT/root
>

^^^^ these lines are not enough and sometime are too much (i.e.: about
losing the customization)

rm -rf project_build_ARCH/PROJECT/autotools-stamps

^^^^ this line resolves the problem to reinstall everything (apart
libfreetype which buggy installation put them in staging_dir but not
in target_dir)

> Once these steps are done then the next make will copy in a clean skeleton
> template and all the other Makefiles will notice the install targets are
> missing and they will install all the targets. This is the cleanest and
> fastest method I have found because this only copies files.
>
> Maybe this should be added to the top level Makefile.


Attached patch allow two more targets:

make install

or

make rootclean install


 I hope this helps,
-- 
/roberto
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Makefile-r23778.patch
Type: text/x-diff
Size: 1654 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081027/81eeb8f1/attachment.patch 
