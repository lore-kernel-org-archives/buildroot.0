From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Mar 2013 18:27:56 +0100
Subject: [Buildroot] [PATCH v4 21/21] qt5: disallow the selection of Qt4
 and Qt5
In-Reply-To: <1363721394-14973-22-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1363721394-14973-22-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <51532C1C.4030902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/03/13 20:29, Thomas Petazzoni wrote:
> As noticed by Arnout, Qt4 and Qt5 cannot be installed together,
> because for example the qt.conf installed by one version cannot be
> understood by the qmake of another version. We therefore make them
> mutually exclusive, which sounds reasonable for the embedded systems
> targeted by Buildroot.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Given that this may expose hard to understand problems when compiling 
Qt applications, I'd like to see this committed rather soon.

  Regards,
  Arnout

> ---
>   package/qt5/Config.in |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index 5662f55..2945d96 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -7,6 +7,7 @@ menuconfig BR2_PACKAGE_QT5
>   	depends on BR2_USE_WCHAR
>   	depends on BR2_INET_IPV6
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_PACKAGE_QT
>   	help
>   	  This option enables the Qt5 framework. Sub-options allow to
>   	  select which modules should be built.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
