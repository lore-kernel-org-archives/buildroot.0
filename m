From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 17 Dec 2012 00:15:54 +0100
Subject: [Buildroot] [PATCH] netatalk : Fix BerkeleyDB library path
In-Reply-To: <87pq29bq11.fsf@dell.be.48ers.dk>
References: <CAGduivwRviPJr6p6ypTZn4U-nDX4HQxXOPYE2s7=zzPZPYozjw@mail.gmail.com>
 <1354981988-32415-1-git-send-email-maxime.hadjinlian@gmail.com>
 <87pq29bq11.fsf@dell.be.48ers.dk>
Message-ID: <CAGduivyvZNaaC8jdLzt1yVju3DS0Vu0fdaQYdHzK6LoRE==nYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 16, 2012 at 11:17 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:
>
>  Maxime> This fix is needed for the 64bits build because Netatalk will assume the library
>  Maxime> are stored in [..]/lib64/ instead of [..]/lib/
>
> Hmm, we still seem to have issues on the autobuilders:
>
> http://autobuild.buildroot.net/results/cf5c3ce94c229204bfa0f19b1009c13a9bcc1dfc/build-end.log
>
>  Maxime> +++ b/package/netatalk/netatalk.mk
>  Maxime> @@ -8,7 +8,7 @@ NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NET
>  Maxime>  NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
>
>  Maxime>  NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error
>  Maxime> -NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99"
>  Maxime> +NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" BDB_LIB=$(STAGING_LIB)/usr/lib
>
>
> I guess you meant STAGING_DIR instead here, will fix.
This is strange because I tested with a 64 bits build and I had'nt the
problem anymore.. And I don't remember rewriting the patch before
sending it here. But then again, you're totally right, this does'nt
make sense. I'm really wondering how it could have worked for me :/
>
> --
> Bye, Peter Korsgaard
