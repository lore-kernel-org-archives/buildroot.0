From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:03:13 +0100
Subject: [Buildroot] [PATCH v2] qt5/qt53d: new package
In-Reply-To: <1449266894-20997-1-git-send-email-ps.report@gmx.net>
References: <1449266894-20997-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151218220313.782f83e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Fri,  4 Dec 2015 23:08:14 +0100, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've applied after doing a few changes. See below.


> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index 22fd0c0..568fadb 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -41,6 +41,7 @@ source "package/qt5/qt5quickcontrols/Config.in"
>  source "package/qt5/qt5sensors/Config.in"
>  source "package/qt5/qt5serialport/Config.in"
>  source "package/qt5/qt5svg/Config.in"
> +source "package/qt5/qt53d/Config.in"

Alphabetic ordering should have been used here.

> +comment "qt53d module needs an OpenGL-capable backend"
> +        depends on !BR2_PACKAGE_QT5_GL_AVAILABLE

This line was indented with spaces, while a tab should be used. Also,
the comment should only be displayed when
BR2_PACKAGE_QT5_JSCORE_AVAILABLE is met.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
