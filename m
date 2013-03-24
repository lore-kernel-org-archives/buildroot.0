From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 24 Mar 2013 19:52:50 +0100
Subject: [Buildroot] [PATCH v4 16/21] qt5/qt5graphicaleffects: new
	package
In-Reply-To: <1363721394-14973-17-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1363721394-14973-17-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMJF+3PoVHUjjyjgxjvAfrJQ6PACM6YHSotiXphVNjg+Dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2013/3/19 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
[...]
> diff --git a/package/qt5/qt5graphicaleffects/Config.in b/package/qt5/qt5graphicaleffects/Config.in
> new file mode 100644
> index 0000000..859cd5a
> --- /dev/null
> +++ b/package/qt5/qt5graphicaleffects/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_QT5GRAPHICALEFFECTS
> +       bool "qt5graphicaleffects"
> +       select BR2_PACKAGE_QT5BASE
> +       select BR2_PACKAGE_QT5DECLARATIVE
> +       help
> +         Qt is a cross-platform application and UI framework for
> +         developers using C++.
> +
> +         This package corresponds to the qt5graphicaleffects module.
> +
> +         http://qt-project.org
> +
> +comment "qt5graphicaleffects requires an OpenGL-capable backend"
> +       depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES
I think you mean:
depends on ! ( BR2_PACKAGE_HAS_OPENGL_EGL || BR2_PACKAGE_HAS_OPENGL_ES )

Also, the opposite 'depends on' statement is missing in the config entry.

Regards,

-- 
Samuel
