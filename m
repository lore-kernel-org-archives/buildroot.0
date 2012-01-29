From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Jan 2012 22:01:54 +0100
Subject: [Buildroot] [PATCH 12/14] libethumb: Add new package
In-Reply-To: <CAFbHwiQ=H1i3_fuQAHmN432s42dxjxeOmSKFbMOWUiyeFnWRdA@mail.gmail.com>
 (Will Newton's message of "Thu, 26 Jan 2012 17:42:52 +0000")
References: <CAFbHwiQ=H1i3_fuQAHmN432s42dxjxeOmSKFbMOWUiyeFnWRdA@mail.gmail.com>
Message-ID: <87ipjui5od.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Signed-off-by: Will Newton <will.newton@imgtec.com>
 Will> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed with minor tweaks, thanks.


 Will> ---
 Will>  package/efl/Config.in              |    1 +
 Will>  package/efl/libethumb/Config.in    |    8 ++++++++
 Will>  package/efl/libethumb/libethumb.mk |   16 ++++++++++++++++
 Will>  3 files changed, 25 insertions(+), 0 deletions(-)
 Will>  create mode 100644 package/efl/libethumb/Config.in
 Will>  create mode 100644 package/efl/libethumb/libethumb.mk

 Will> diff --git a/package/efl/Config.in b/package/efl/Config.in
 Will> index b747953..1632290 100644
 Will> --- a/package/efl/Config.in
 Will> +++ b/package/efl/Config.in
 Will> @@ -16,6 +16,7 @@ source "package/efl/libefreet/Config.in"
 Will>  source "package/efl/libevas/Config.in"
 Will>  source "package/efl/libembryo/Config.in"
 Will>  source "package/efl/libedje/Config.in"
 Will> +source "package/efl/libethumb/Config.in"

 Will>  endif # BR2_PACKAGE_EFL

 Will> diff --git a/package/efl/libethumb/Config.in b/package/efl/libethumb/Config.in
 Will> new file mode 100644
 Will> index 0000000..6f59e00
 Will> --- /dev/null
 Will> +++ b/package/efl/libethumb/Config.in
 Will> @@ -0,0 +1,8 @@
 Will> +config BR2_PACKAGE_LIBETHUMB
 Will> +	bool "libethumb"
 Will> +	select BR2_PACKAGE_LIBEINA
 Will> +	select BR2_PACKAGE_LIBEVAS
 Will> +	select BR2_PACKAGE_LIBECORE
 Will> +	select BR2_PACKAGE_LIBEDJE

LIBECORE_EVAS is needed as well.

 Will> +	help
 Will> +	  Ethumb is a library for generating thumbnail images of documents.

Upstream URL missing.

-- 
Bye, Peter Korsgaard
