From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Jan 2012 23:03:15 +0100
Subject: [Buildroot] [PATCH 04/14] libeina: Add new package along with
	EFL infrastructure
In-Reply-To: <CAFbHwiT0gRXscpUTjtzdwGRruwKETPcmW-zS+eGrqAHfYQnJQw@mail.gmail.com>
 (Will Newton's message of "Thu, 26 Jan 2012 17:42:25 +0000")
References: <CAFbHwiT0gRXscpUTjtzdwGRruwKETPcmW-zS+eGrqAHfYQnJQw@mail.gmail.com>
Message-ID: <87pqe6ceak.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Signed-off-by: Will Newton <will.newton@imgtec.com>
 Will> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Will> ---

 Will> +++ b/package/efl/libeina/Config.in
 Will> @@ -0,0 +1,4 @@
 Will> +config BR2_PACKAGE_LIBEINA
 Will> +	bool "libeina"
 Will> +	help
 Will> +	  Eina is a tiny library to handle data types (list, hash, etc.)

Heh, the compressed tarball is almost 10MB.

You forgot to add an upstream URL. I've added
http://trac.enlightenment.org/e/wiki/Eina

 Will> diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
 Will> new file mode 100644
 Will> index 0000000..3ed43db
 Will> --- /dev/null
 Will> +++ b/package/efl/libeina/libeina.mk
 Will> @@ -0,0 +1,16 @@
 Will> +#############################################################
 Will> +#
 Will> +# libeina
 Will> +#
 Will> +#############################################################
 Will> +
 Will> +LIBEINA_VERSION = 1.1.0
 Will> +LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
 Will> +LIBEINA_SITE = http://download.enlightenment.org/releases/
 Will> +LIBEINA_AUTORECONF = YES

You're not patching any auto* files, so no need to autoreconf.

Otherwise it looks good - Committed, thanks.

-- 
Bye, Peter Korsgaard
