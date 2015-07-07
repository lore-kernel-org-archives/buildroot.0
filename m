From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 Jul 2015 00:22:58 +0200
Subject: [Buildroot] [PATCH V4] sdl2: new package
In-Reply-To: <1435824981-6312-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <20150629222241.GF3669@free.fr>
 <1435824981-6312-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <559C5142.3090506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/15 10:16, Guillaume GARDET wrote:
> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Yann E. Morin <yann.morin.1998@free.fr>

  Since you're anyway spinning a v5, one more comment:

> 
> ---

[snip]
> diff --git a/package/Config.in b/package/Config.in
> index 13a7e74..3a1b5c6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -246,6 +246,7 @@ endif
>  	source "package/psplash/Config.in"
>  	source "package/sawman/Config.in"
>  	source "package/sdl/Config.in"
> +	source "package/sdl2/Config.in"

 Even though this is correct alphabetical ordering, it's not so good. Currently,
when you select sdl, the SDL modules, below, will be indented in menuconfig so
it is clear they belong to the SDL package. By putting sdl2 in-between, the
indentation will be gone.

 Actually, the sdl_* packages should not have this 'depends on ' line but
instead there should be a condition here, then it would be much clearer. But
it's not a perfect world...

 Regards,
 Arnout

>  	source "package/sdl_gfx/Config.in"
>  	source "package/sdl_image/Config.in"
>  	source "package/sdl_mixer/Config.in"

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
