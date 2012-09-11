From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Sep 2012 23:38:49 +0200
Subject: [Buildroot] [PATCH] qtuio: new package
In-Reply-To: <1346328506-27403-1-git-send-email-sho@relinux.de>
References: <1346328506-27403-1-git-send-email-sho@relinux.de>
Message-ID: <504FAF69.5060004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/30/12 14:08, Stephan Hoffmann wrote:
> Implementation of an interface connecting TUIO messages and QT events
>
> https://github.com/x29a/qTUIO
>
> Signed-off-by: Stephan Hoffmann<sho@relinux.de>

  Minor comments below, but regardless:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  build-tested with a minimal internal toolchain for ARM.

> ---
> Included fixes suggested by Thomas Petazzoni
> Removed dependency from mtdev2tuio
> Install library to staging
>
>   package/Config.in       |    3 ++
>   package/qtuio/Config.in |   18 ++++++++++++
>   package/qtuio/qtuio.mk  |   70 +++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 91 insertions(+), 0 deletions(-)
>   create mode 100644 package/qtuio/Config.in
>   create mode 100644 package/qtuio/qtuio.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index e129522..94430b0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -134,6 +134,9 @@ source "package/efl/Config.in"
>   source "package/qt/Config.in"
>   source "package/x11r7/Config.in"
>
> +comment "QT libraries and helper libraries"
> +source "package/qtuio/Config.in"
> +

  Put this before x11r7.

>   comment "X libraries and helper libraries"
>   source "package/liberation/Config.in"
>   source "package/libsexy/Config.in"
[snip]
> +# Unfortunatelly, there is no working "install" target available
                 ^ one l: Unfortunately


[snip]

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
