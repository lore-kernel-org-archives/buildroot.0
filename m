From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 04 Apr 2013 13:52:11 +0200
Subject: [Buildroot] [PATCH] qtuio: depends on QT4
In-Reply-To: <1364662519-2385-1-git-send-email-sho@relinux.de>
References: <1364662519-2385-1-git-send-email-sho@relinux.de>
Message-ID: <515D696B.9080608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/03/13 17:55, Stephan Hoffmann wrote:
> Fixes: http://autobuild.buildroot.net/results/e6501a7a487ec3a02463ad0f3aa60168883fa369/
>
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> ---
>   package/qtuio/Config.in |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/package/qtuio/Config.in b/package/qtuio/Config.in
> index 19499fd..590b2de 100644
> --- a/package/qtuio/Config.in
> +++ b/package/qtuio/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_QTUIO
>   	bool "qtuio"
> -	depends on BR2_PACKAGE_QT_GUI_MODULE
> +	depends on BR2_PACKAGE_QT_GUI_MODULE && !BR2_PACKAGE_QT5

  Thomas has a patch pending which makes qt4 and qt5 mutually exclusive 
(because any qt package will fail if both are installed, because of 
inconsistencies in the qmake configurations). So this change should be 
redundant.

>   	help
>   	  Implementation of an interface connecting TUIO messages
>   	  and QT events
> @@ -16,3 +16,5 @@ config BR2_QTUIO_EXAMPLES
>   comment "qtuio depends on QT gui module"
>   	depends on !BR2_PACKAGE_QT_GUI_MODULE
>
> +comment "qtuio requires QT4"
> +	depends on BR2_PACKAGE_QT5

  This one may still be useful though.


  Regards,
  Arnout

>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
