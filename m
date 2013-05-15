From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 15 May 2013 11:15:22 +0100
Subject: [Buildroot] [PATCH] libxml2: depend on zlib and libiconv if
	appropriate
In-Reply-To: <87obcdqq03.fsf@dell.be.48ers.dk>
References: <1368520183-8049-1-git-send-email-spdawson@gmail.com>
 <87obcdqq03.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCO56x=mqnJ_YGRSaDL8n9sfYEdRJctSt4W4iPp37BbAMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14 May 2013 21:13, Peter Korsgaard <jacmet@uclibc.org> wrote:
>  spdawson> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
>  spdawson> +LIBXML2_DEPENDENCIES += libiconv
>  spdawson> +LIBXML2_CONF_OPT += --with-iconv
>  spdawson> +else
>  spdawson> +LIBXML2_CONF_OPT += --without-iconv
>  spdawson> +endif
>
> Hmm, that seems wrong. If the toolchain has locale support, then it has
> iconv(), so we shouldn't disable iconv support.
>
> Something like:
>
> LIBXML2_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
>
> ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
> LIBXML2_CONF_OPT += --with-iconv
> else
> LIBXML2_CONF_OPT += --without-iconv
> endif

Okay; thanks Peter. Will fix and resubmit.

Simon.
