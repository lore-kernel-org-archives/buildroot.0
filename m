From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jan 2013 21:45:41 +0100
Subject: [Buildroot] [PATCH] ncdu: new package
In-Reply-To: <1358347774-11998-2-git-send-email-bogdan@nimblex.net> (Bogdan
 Radulescu's message of "Wed, 16 Jan 2013 14:49:34 +0000")
References: <1358347774-11998-1-git-send-email-bogdan@nimblex.net>
 <1358347774-11998-2-git-send-email-bogdan@nimblex.net>
Message-ID: <87ehhfd1my.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bogdan" == Bogdan Radulescu <bogdan@nimblex.net> writes:

 Bogdan> ---
 Bogdan>  package/Config.in      |  1 +
 Bogdan>  package/ncdu/Config.in |  7 +++++++
 Bogdan>  package/ncdu/ncdu.mk   | 14 ++++++++++++++
 Bogdan>  3 files changed, 22 insertions(+)
 Bogdan>  create mode 100644 package/ncdu/Config.in
 Bogdan>  create mode 100644 package/ncdu/ncdu.mk

 Bogdan> diff --git a/package/Config.in b/package/Config.in
 Bogdan> index c59f342..e981ac2 100644
 Bogdan> --- a/package/Config.in
 Bogdan> +++ b/package/Config.in
 Bogdan> @@ -778,6 +778,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Bogdan>  source "package/module-init-tools/Config.in"
 Bogdan>  endif
 Bogdan>  source "package/monit/Config.in"
 Bogdan> +source "package/ncdu/Config.in"
 Bogdan>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Bogdan>  source "package/procps/Config.in"
 Bogdan>  source "package/psmisc/Config.in"
 Bogdan> diff --git a/package/ncdu/Config.in b/package/ncdu/Config.in
 Bogdan> new file mode 100644
 Bogdan> index 0000000..dac7444
 Bogdan> --- /dev/null
 Bogdan> +++ b/package/ncdu/Config.in
 Bogdan> @@ -0,0 +1,7 @@
 Bogdan> +config BR2_PACKAGE_NCDU
 Bogdan> +	bool "ncdu"
 Bogdan> +	select BR2_PACKAGE_NCURSES
 Bogdan> +	help
 Bogdan> +	  ncdu is a disk usage analyzer with an ncurses interface
 Bogdan> +
 Bogdan> +	  http://dev.yorhel.nl/ncdu
 Bogdan> diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
 Bogdan> new file mode 100644
 Bogdan> index 0000000..5c28178
 Bogdan> --- /dev/null
 Bogdan> +++ b/package/ncdu/ncdu.mk
 Bogdan> @@ -0,0 +1,14 @@
 Bogdan> +#############################################################
 Bogdan> +#
 Bogdan> +# ncdu
 Bogdan> +#
 Bogdan> +#############################################################
 Bogdan> +NCDU_VERSION = 1.9

We normally have an empty line before the _VERSION line. Other than that
it looks good - Committed, thanks.

-- 
Bye, Peter Korsgaard
