From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 Apr 2018 23:47:33 +0200
Subject: [Buildroot] [PATCH v3 2/2] qt5base: add sunxi-mali-mainline
 eglfs backend
In-Reply-To: <1510598515-29485-2-git-send-email-giulio.benetti@micronovasrl.com>
References: <1510598515-29485-1-git-send-email-giulio.benetti@micronovasrl.com>
 <1510598515-29485-2-git-send-email-giulio.benetti@micronovasrl.com>
Message-ID: <2dac2310-9265-1574-ace2-2b11724b9e3b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-11-17 19:41, Giulio Benetti wrote:
> qt5base: add support for sunxi-mali-mainline eglfs backend
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index ef99131..6ea42ec 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -245,6 +245,8 @@ ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
>  QT5BASE_EGLFS_DEVICE = eglfs_viv
>  else ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
>  QT5BASE_EGLFS_DEVICE = eglfs_mali
> +else ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE),y)

 I've merged the two sunxi-mali cases into a single condition and applied to
master, thanks.

 Regards,
 Arnout

> +QT5BASE_EGLFS_DEVICE = eglfs_mali
>  endif
>  endif
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
