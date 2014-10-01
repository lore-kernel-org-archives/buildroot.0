From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 1 Oct 2014 22:05:48 +0200
Subject: [Buildroot] [PATCH 2/2] opencv: Let opencv's build system
 handle the ts module dependencies
In-Reply-To: <1412165881-64965-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1412165881-64965-1-git-send-email-Vincent.Riera@imgtec.com>
 <1412165881-64965-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <CAHXCMML4wgCRFUkYnuhBAEc833FLo4wK4FUg9j7AsA=JpDT8Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincente, all,

On Wed, Oct 1, 2014 at 2:18 PM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> In the former version of opencv we added a patch to fix a dependencies
> problem in the ts module. That issue was reported upstream and is now
> merged in the 2.4.10 version:
>
>   https://github.com/Itseez/opencv/commit/7018f9495920f974258502b9b8b26af16d7ee427
>
> So now we can revert our former patch and let opencv's build system
> handle the ts module dependencies as we already do in the other modules.
>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/opencv/Config.in |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index d648e5e..24f540e 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -101,7 +101,6 @@ config BR2_PACKAGE_OPENCV_LIB_SUPERRES
>
>  config BR2_PACKAGE_OPENCV_LIB_TS
>         bool "ts (touchscreen)"
> -       select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>         default y
>         help
>           Include opencv_ts module into the OpenCV build.

Thought I understand that you want to keep this knob similar to the
others, it is in contradiction with some pending patch [1] which fix
the inter OpenCV modules dependencies.

Whatever this patch got merged or not, the patch [1] will need to be
updated after the bump to OpenCV-2.4.10 is merged.
So, I have no strong opinion about this patch:
- applying it won't break the autobuilders;
- whereas not applying it only does not improve that much the
situation wrt the issue that [1] attemps to fix.


Regards,


[1] http://patchwork.ozlabs.org/patch/384577/

-- 
Samuel
