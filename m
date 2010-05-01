From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 01 May 2010 22:21:40 +0200
Subject: [Buildroot] [PATCH] Make Mesa3D optional for X11
In-Reply-To: <20100429202418.7426.16656.stgit@localhost.localdomain> (Paulius
	Zaleckas's message of "Thu, 29 Apr 2010 23:24:18 +0300")
References: <20100429202418.7426.16656.stgit@localhost.localdomain>
Message-ID: <87ocgz5q5n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

 Paulius> From: Darius Augulis <augulis.darius@gmail.com>
 Paulius> Signed-off-by: Darius Augulis <augulis.darius@gmail.com>
 Paulius> Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>

 Paulius> +++ b/package/x11r7/xserver_xorg-server/Config.in
 Paulius> @@ -2,7 +2,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 Paulius>  	bool "xorg-server"
 Paulius>  	select BR2_PACKAGE_LIBDRM
 Paulius>  	select BR2_PACKAGE_MCOOKIE
 Paulius> -	select BR2_PACKAGE_MESA3D if BR2_PACKAGE_XSERVER_xorg
 Paulius>  	select BR2_PACKAGE_OPENSSL
 Paulius>  	select BR2_PACKAGE_PIXMAN
 Paulius>  	select BR2_PACKAGE_XFONT_FONT_ALIAS if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS

Committed - You forgot to make the 'select
BR2_PACKAGE_XPROTO_XF86DRIPROTO' optional on mesa3d in
xserver/Config.in, but I fixed that.

-- 
Bye, Peter Korsgaard
