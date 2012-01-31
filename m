From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 31 Jan 2012 23:52:55 +0100
Subject: [Buildroot] [PATCH 8/8] lttng-babeltrace: new package
In-Reply-To: <8909ec4e636e84ac7cdf6a0b0c6c51c1bd36ccd6.1328038759.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 31 Jan 2012 20:40:06 +0100")
References: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <8909ec4e636e84ac7cdf6a0b0c6c51c1bd36ccd6.1328038759.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vcnrh4c8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> +++ b/package/lttng-babeltrace/lttng-babeltrace.mk
 Thomas> @@ -0,0 +1,17 @@
 Thomas> +LTTNG_BABELTRACE_SITE    = http://lttng.org/files/bundles/20111214/
 Thomas> +LTTNG_BABELTRACE_VERSION = 0.8
 Thomas> +LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 Thomas> +
 Thomas> +# Needed to fix libtool handling, otherwise the build fails when
 Thomas> +# building the ctf-parser-test program, which depends on libctf-ast.so
 Thomas> +# which itself depends on libbabeltrace_types.so.0 (and libtool gets
 Thomas> +# lost in the middle of this).
 Thomas> +LTTNG_BABELTRACE_AUTORECONF      = YES
 Thomas> +HOST_LTTNG_BABELTRACE_AUTORECONF = YES
 Thomas> +
 Thomas> +LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 Thomas> +
 Thomas> +HOST_LTTNG_BABELTRACE_DEPENDENCIES = host-popt host-libglib2 host-util-linux

HOST_..._DEPENDENCIES are now automatically derived from _DEPENDENCIES
by default, so this can be dropped.

Other than that it looks good, committed - Thanks.

-- 
Bye, Peter Korsgaard
