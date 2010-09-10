From: Phil Edworthy <Phil.Edworthy@renesas.com>
Date: Fri, 10 Sep 2010 13:59:53 +0100
Subject: [Buildroot] [PATCH] Fix 'make source' when used with external
	toolchains
Message-ID: <AB12B32E73474741A2C5361C433A44DE021912DD@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When you do 'make source', Buildroot unconditionally downloads gcc and
binutils/mpfr. When using an external toolchain, BR2_GCC_VERSION isn't set
so the download fails. 

This patch makes the download conditional.

Regards
Phil
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Fix-make-source-when-used-with-external-toolchains.patch
Type: application/octet-stream
Size: 2003 bytes
Desc: 0001-Fix-make-source-when-used-with-external-toolchains.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100910/3a3dc6a9/attachment.obj>
