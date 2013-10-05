From: Fatih =?utf-8?B?QcWfxLFjxLE=?= <fatih.asici@gmail.com>
Date: Sun, 06 Oct 2013 00:21:19 +0300
Subject: [Buildroot] [PATCH v2 1/6] qt5: bump to 5.1.1
In-Reply-To: <20131004120957.GA5127@localhost>
References: <1379655795-22429-1-git-send-email-fatih.asici@gmail.com>
 <1379655795-22429-2-git-send-email-fatih.asici@gmail.com>
 <20131004120957.GA5127@localhost>
Message-ID: <7143993.yq9Pe174uQ@asici>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Friday 04 October 2013 09:09:58 Ezequiel Garcia wrote:
> I'm trying the series right now and noticed that qt5base build fails if
> PNG is not enabled. Apparently, you noticed first as you already
> reported this and provided a fix:
> 
>   https://bugreports.qt-project.org/browse/QTBUG-33496
> 
> Care to add this patch as well to Buildroot and push the fix upstream?
> 
> Apparently with this new version of Qt5, the examples get built: they
> aren't built with the current v5.0.2.
> 
> So, it would be nice to add support to build the examples (which we
> had in Qt 4.8).
> 
> I think embedded developers might find examples of great use: I use them to
> quickly check the hardware support is OK (test touchscreen, the buttons,
> and so on).
> 
> I would do it myself, but I tried to use something like this:
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 0106c2c..9585b10 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -176,7 +176,6 @@ define QT5BASE_CONFIGURE_CMDS
>                 -sysroot $(STAGING_DIR) \
>                 -plugindir /usr/lib/qt/plugins \
>                 -no-rpath \
> -               -nomake examples -nomake tests \
>                 -device buildroot \
>                 -no-c++11 \
>                 $(QT5BASE_CONFIGURE_OPTS) \
> 
> And for some reason it tries to build the widgets/windowcontainer
> example which depends on OpenGL. This is wrong since OpenGL is disabled.
> I'm not sure what can be happening, since this example is not built in
> my desktop (also non-OpenGL) Qt5 build.
> 
> Maybe you can take a look and fix? If you know the workaround to fix the
> above I can try to push the patch myself.

I have sent two patches to the list for both issues. They are based on my 
patch series bumping version to 5.1.1.
