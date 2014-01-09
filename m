From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 9 Jan 2014 19:43:17 +0200
Subject: [Buildroot] [PATCH] libnfc-llcp: rename to libllcp and bump
 version
In-Reply-To: <1389287265-1498-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1389287265-1498-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140109174317.GX4659@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Thu, Jan 09, 2014 at 05:07:45PM +0000, Vicente Olivert Riera wrote:
> This package has been renamed upstream to libllcp. Also, the current
> package we have in Buildroot fails to compile due to a version bump of
> it's main dependence, libnfc. A version bump is required because this
> package has been adapted upstream to work with libnfc-1.7.0-rc6.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/Config.in                          |    2 +-
>  package/{libnfc-llcp => libllcp}/Config.in |    6 +++---
>  package/libllcp/libllcp.mk                 |   15 +++++++++++++++
>  package/libnfc-llcp/libnfc-llcp.mk         |   15 ---------------
>  4 files changed, 19 insertions(+), 19 deletions(-)
>  rename package/{libnfc-llcp => libllcp}/Config.in (56%)
>  create mode 100644 package/libllcp/libllcp.mk
>  delete mode 100644 package/libnfc-llcp/libnfc-llcp.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 8af6a1e..ce9a130 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -567,7 +567,7 @@ source "package/libhid/Config.in"
>  source "package/libiqrf/Config.in"
>  source "package/libmbim/Config.in"
>  source "package/libnfc/Config.in"
> -source "package/libnfc-llcp/Config.in"
> +source "package/libllcp/Config.in"

It seems that the order should change as well to keep the list alphabetically 
ordered.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
