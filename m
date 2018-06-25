From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 22:15:23 +0200
Subject: [Buildroot] [PATCH 1/2] pamtester: new package
In-Reply-To: <20180621163344.24552-2-casantos@datacom.com.br>
References: <20180621163344.24552-1-casantos@datacom.com.br>
 <20180621163344.24552-2-casantos@datacom.com.br>
Message-ID: <20180625221523.7b78ef50@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Jun 2018 13:33:43 -0300, Carlos Santos wrote:

> diff --git a/package/Config.in b/package/Config.in
> index a5ecfecbf9..36e1c2a412 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1568,6 +1568,7 @@ menu "Other"
>  	source "package/linux-pam/Config.in"
>  	source "package/llvm/Config.in"

Meh, we now have LLVM between PAM and its plugins. Not good. This
should be fixed separately.

>  if BR2_PACKAGE_LINUX_PAM
> +	source "package/pamtester/Config.in"

pamtester is not a library, so I don't think Libraries->Other is the
right place for it.

Maybe in "System tools", with a "depends on BR2_PACKAGE_LINUX_PAM" ?

> diff --git a/package/pamtester/0001-fix-spelling-errors.patch b/package/pamtester/0001-fix-spelling-errors.patch
> new file mode 100644
> index 0000000000..5f79754e34
> --- /dev/null
> +++ b/package/pamtester/0001-fix-spelling-errors.patch
> @@ -0,0 +1,19 @@
> +Description: Fix spelling error in pamtester
> +Origin: vendor
> +Bug: https://sourceforge.net/tracker/?func=detail&aid=3599109&group_id=135111&atid=731890
> +Forwarded: yes
> +Author: Salvatore Bonaccorso <carnil@debian.org>
> +Last-Update: 2013-01-01
> +Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
> +
> +--- a/src/app.c
> ++++ b/src/app.c
> +@@ -373,7 +373,7 @@
> + 				err_msg = xstrdup(pam_strerror(pamh, err));
> + 				goto out;
> + 			} else {
> +-				printf("%s: sucessfully opened a session\n", params->app_name);
> ++				printf("%s: successfully opened a session\n", params->app_name);
> + 			}
> + 		} else if (!strcasecmp(op->name, "close_session")) {
> + 			int flag = 0;

Do we really need to carry a patch fixing a typo in a debug message ?

If yes, then please add your Signed-off-by.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
