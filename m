From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 7 Jun 2018 11:26:17 -0500
Subject: [Buildroot] [PATCH 1/1] fix qtwebengine enable condition
In-Reply-To: <20180607134528.7098-1-david.barbion@ext.leroymerlin.fr>
References: <20180607134528.7098-1-david.barbion@ext.leroymerlin.fr>
Message-ID: <CANQCQpaV-PG7ShizN5vgdDhUC+V5LRx4bhdXRTEU6992rcV-iQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David,

2018-06-07 8:45 GMT-05:00 David Barbion <david.barbion@ext.leroymerlin.fr>:
> Signed-off-by: David Barbion <david.barbion@ext.leroymerlin.fr>
> ---
>  package/qt5/qt5webengine/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index 38486c6dcf..744d659567 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -31,7 +31,7 @@ config BR2_PACKAGE_QT5WEBENGINE
>         depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
>         depends on BR2_HOST_GCC_AT_LEAST_4_8 # qt5base-icu
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5base-icu
> -       depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || BR2_PACKAGE_QT5_VERSION_5_6 # libnss
> +       depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || BR2_PACKAGE_QT5_VERSION_5_6 # libnss
>         depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
>         depends on BR2_USE_WCHAR # libglib2
>         depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
> --

Oops, sorry about the bug :-)

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
