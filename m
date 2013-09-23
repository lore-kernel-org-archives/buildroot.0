From: Simon Dawson <spdawson@gmail.com>
Date: Mon, 23 Sep 2013 08:54:40 +0100
Subject: [Buildroot] [PATCH] xapp_xscreensaver: new package
In-Reply-To: <87ioxs9e3z.fsf@dell.be.48ers.dk>
References: <1379872398-25558-1-git-send-email-spdawson@gmail.com>
 <87ioxs9e3z.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCPkZbFt7zvQtXbz-Pmcepy4X0YNAMKPJqs1xq4cRz0QnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23 September 2013 08:44, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:
>  spdawson> +            source package/x11r7/xapp_xscreensaver/Config.in
>
> Like Thomas commented on the recently posted lesstif package, this
> shouldn't go under x11r7 as it isn't part of x.org (and should just be
> called xscreensaver).

Okay; I'll move it.

>  spdawson> +XAPP_XSCREENSAVER_LICENSE = MIT-like
>  spdawson> +XAPP_XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h
>
> According to the Debian package, it also contains GPLv2+ parts
> (hacks/glx/chessmodels.{c,man}), but perhaps we don't build that file?
>
> A comment explaining it might be good.

Ah, right. I'll fix this then.

>  spdawson> +XAPP_XSCREENSAVER_CONF_OPT += \
>  spdawson> +    CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
>  spdawson> +    LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib" \
>
> The compiler should already be looking under STAGING_DIR, why is this
> needed?

Right; not needed, in fact. I'll remove this in the next iteration of the patch.

Simon.
