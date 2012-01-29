From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Jan 2012 21:48:51 +0100
Subject: [Buildroot] [PATCH 11/14] libefreet: Add new package
In-Reply-To: <CAFbHwiToPSSEQdBxNjpEfwR-dgn7c3Bk00R6d1ZesULL-Yp=iQ@mail.gmail.com>
 (Will Newton's message of "Thu, 26 Jan 2012 17:42:49 +0000")
References: <CAFbHwiToPSSEQdBxNjpEfwR-dgn7c3Bk00R6d1ZesULL-Yp=iQ@mail.gmail.com>
Message-ID: <87mx96i6a4.fsf@macbook.be.48ers.dk>
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
 Will>  package/efl/libefreet/Config.in    |    8 ++++++++
 Will>  package/efl/libefreet/libefreet.mk |   14 ++++++++++++++
 Will>  3 files changed, 23 insertions(+), 0 deletions(-)
 Will>  create mode 100644 package/efl/libefreet/Config.in
 Will>  create mode 100644 package/efl/libefreet/libefreet.mk

 Will> diff --git a/package/efl/Config.in b/package/efl/Config.in
 Will> index 258d99a..b747953 100644
 Will> --- a/package/efl/Config.in
 Will> +++ b/package/efl/Config.in
 Will> @@ -12,6 +12,7 @@ source "package/efl/expedite/Config.in"
 Will>  source "package/efl/libeina/Config.in"
 Will>  source "package/efl/libecore/Config.in"
 Will>  source "package/efl/libeet/Config.in"
 Will> +source "package/efl/libefreet/Config.in"
 Will>  source "package/efl/libevas/Config.in"
 Will>  source "package/efl/libembryo/Config.in"
 Will>  source "package/efl/libedje/Config.in"
 Will> diff --git a/package/efl/libefreet/Config.in b/package/efl/libefreet/Config.in
 Will> new file mode 100644
 Will> index 0000000..7a43501
 Will> --- /dev/null
 Will> +++ b/package/efl/libefreet/Config.in
 Will> @@ -0,0 +1,8 @@
 Will> +config BR2_PACKAGE_LIBEFREET
 Will> +	bool "libefreet"
 Will> +	select BR2_PACKAGE_LIBEINA
 Will> +	select BR2_PACKAGE_LIBEET
 Will> +	select BR2_PACKAGE_LIBECORE
 Will> +	help
 Will> +	  Efreet is a library designed to help apps work several of the

There seems to be a 'with' missing (also on upstream website)

 Will> +	  Freedesktop.org standards regarding Icons, Desktop files and Menus.

Upstream URL missing.

-- 
Bye, Peter Korsgaard
