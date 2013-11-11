From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 17:24:35 +0100
Subject: [Buildroot] [PATCH] libqmi: fix autobuild failures
In-Reply-To: <1384184627-8102-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 11 Nov 2013 15:43:47 +0000")
References: <1384184627-8102-1-git-send-email-spdawson@gmail.com>
Message-ID: <87y54u6h4s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

> From: Simon Dawson <spdawson@gmail.com>
> The libqmi build specifies -Werror in the CFLAGS by default. This causes
> build failures such as the following.

>   http://autobuild.buildroot.net/results/070/070449299aa9025c4bc6769524a6e22d66c92a65/

> The -Werror flag can be disabled using a configuration switch.

> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  package/libqmi/libqmi.mk | 2 ++
>  1 file changed, 2 insertions(+)

> diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
> index 911b1a7..8bd4577 100644
> --- a/package/libqmi/libqmi.mk
> +++ b/package/libqmi/libqmi.mk
> @@ -13,4 +13,6 @@ LIBQMI_INSTALL_STAGING = YES
 
>  LIBQMI_DEPENDENCIES = libglib2
 
> +LIBQMI_CONF_OPT = --enable-more-warnings=yes

That's not immediately obvious. Looking at compiler-warnings.m4 I see
that =yes adds a bunch of -Wblah options to CFLAGS, so I instead changed
it to =no and added a comment why.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
