From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 8 Nov 2012 22:44:14 +0100
Subject: [Buildroot] [PATCH 1/2] netatalk: Add missing dependency to
	netatalk
In-Reply-To: <1352410357-10639-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <CAGduivyH58U-11zTOZRqpcF-HrtFxeunom1xtjPFZaPZBvswpQ@mail.gmail.com>
 <1352410357-10639-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CAGduivwHS+q348W=XtyNi+Jx0yiTHJtmz4jimxU7WTCDKYT-9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, I messed up with the message id and did not end up in the right
thread (should have tested with my own mail), do you want me to resend
them so they correctly appear in the right thread (also I should have
marked them as v2 :/)

On Thu, Nov 8, 2012 at 10:32 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> Netatalk need pkg-config, otherwise the configure script is complaining.
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/netatalk/netatalk.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
> index c01e360..4aa179e 100644
> --- a/package/netatalk/netatalk.mk
> +++ b/package/netatalk/netatalk.mk
> @@ -7,7 +7,7 @@ NETATALK_VERSION = 3.0
>  NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
>  NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
>
> -NETATALK_DEPENDENCIES = openssl berkeleydb libgcrypt libgpg-error
> +NETATALK_DEPENDENCIES = host-pkg-config openssl berkeleydb libgcrypt libgpg-error
>  NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99"
>  NETATALK_CONF_OPT += --with-cnid-cdb-backend \
>         --with-bdb=$(STAGING_DIR)/usr \
> --
> 1.7.10.4
>
