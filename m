From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Apr 2012 22:35:13 +0200
Subject: [Buildroot] [PATCH] libcurl: enabled IPv6 support
In-Reply-To: <1335163564-1368-1-git-send-email-vsergeev@gmail.com> (Vanya
 Sergeev's message of "Mon, 23 Apr 2012 02:46:04 -0400")
References: <1335163564-1368-1-git-send-email-vsergeev@gmail.com>
Message-ID: <87lilkg96m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vanya" == Vanya Sergeev <vsergeev@gmail.com> writes:

 Vanya> From: vsergeev <vsergeev@gmail.com>
 Vanya> Modified libcurl package Makefile to pass the configure option for IPv6 support
 Vanya> if BR2_INET_IPV6 is set.

 Vanya> Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
 Vanya> ---
 Vanya>  package/libcurl/libcurl.mk |    4 ++++
 Vanya>  1 file changed, 4 insertions(+)

 Vanya> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
 Vanya> index e094e31..127d9ca 100644
 Vanya> --- a/package/libcurl/libcurl.mk
 Vanya> +++ b/package/libcurl/libcurl.mk
 Vanya> @@ -10,6 +10,10 @@ LIBCURL_SITE = http://curl.haxx.se/download
 Vanya>  LIBCURL_INSTALL_STAGING = YES
 Vanya>  LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols
 
 Vanya> +ifeq ($(BR2_INET_IPV6),y)
 Vanya> +LIBCURL_CONF_OPT += --enable-ipv6

Curl might be a bit special in the sense that it is using AC_TRY_RUN
to detect ipv6 support (which doesn't work when cross compiling), but
other packages might have the same problem and we already handle ipv6
disabling on a global level, so I have instead added --enable-ipv6 when
BR2_INET_IPV6 is enabled on a global level in package/Makefile.in.

-- 
Bye, Peter Korsgaard
