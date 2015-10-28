From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Oct 2015 21:56:13 +0100
Subject: [Buildroot] [PATCH 1/1] lirc-tools: remove non-existing
 configuration options
In-Reply-To: <CAOcYpt15bNoAyRdi7bRCiK+5jppz2MNYSuOjZUu5+6qzTLAprg@mail.gmail.com>
References: <CAOcYpt15bNoAyRdi7bRCiK+5jppz2MNYSuOjZUu5+6qzTLAprg@mail.gmail.com>
Message-ID: <5631366D.6080802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27-10-15 00:21, David Kosir wrote:
>>From 23cf11e0463ffe1d99f3331c0bcaaed7ca94ad85 Mon Sep 17 00:00:00 2001
> From: David Kosir <david.kosir@bylapis.com>
> Date: Mon, 26 Oct 2015 23:49:40 +0100
> Subject: [PATCH 1/1] lirc-tools: remove non-existing configuration options
> 
> --enable-sandboxed and --with-driver options were used in 0.9.1
>>From 0.9.2 they are not used anymore.
> 
> Signed-off-by: David Kosir <david.kosir@bylapis.com>

 Looks good to me, but you didn't send it with git send-email and your mailer
added some whitespace errors which makes the patch not apply.

 I'll resend it now.

 Regards,
 Arnout

> ---
>  package/lirc-tools/lirc-tools.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
> index 2052b72..fbd8aaf 100644
> --- a/package/lirc-tools/lirc-tools.mk
> +++ b/package/lirc-tools/lirc-tools.mk
> @@ -11,10 +11,7 @@ LIRC_TOOLS_LICENSE = GPLv2+
>  LIRC_TOOLS_LICENSE_FILES = COPYING
>  LIRC_TOOLS_DEPENDENCIES = host-pkgconf
> 
> -LIRC_TOOLS_CONF_OPTS = \
> -    --without-x \
> -    --enable-sandboxed \
> -    --with-driver=userspace
> +LIRC_TOOLS_CONF_OPTS = --without-x
> 
>  define LIRC_TOOLS_INSTALL_INIT_SYSV
>      $(INSTALL) -D -m 0755 package/lirc-tools/S25lircd \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
