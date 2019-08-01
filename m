From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 14:58:47 +0200
Subject: [Buildroot] [PATCH buildroot-test 2/4] utils/daily-mail: allow
 to print a header for results section
In-Reply-To: <20190708081406.28215-3-victor.huesca@bootlin.com>
References: <20190708081406.28215-1-victor.huesca@bootlin.com>
 <20190708081406.28215-3-victor.huesca@bootlin.com>
Message-ID: <20190801145847.43d0aae8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Jul 2019 10:14:04 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> This table quite clear without header but as I had a template for the outdated
> table I also added the possibility to include one for results too.
> 
> Note that this commit only add the option to print the header but does not
> enable it, so the existing behavior is preserved.
> 
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
> ---
>  utils/daily-mail | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/daily-mail b/utils/daily-mail
> index 4ab7710..b4d0a56 100755
> --- a/utils/daily-mail
> +++ b/utils/daily-mail
> @@ -158,8 +158,25 @@ def add_outdated_pkg_notification(notifications, outdated_pkg):
>              notif = get_notification_for_dev(notifications, get_orphan_developer())
>              notif.package_version_notification.append(pkg)
>  
> -def show_results(results, show_status, show_orphan=False):
> +
> +def show_results(results, show_status, show_orphan=False, show_header=False):

As I replied in my review of PATCH 1/4, please make this unconditional.
And this patch should come *before* the outdated package feature.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
