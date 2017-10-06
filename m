From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 21:23:07 +0200
Subject: [Buildroot] [PATCH v3 4/4] package/freeswitch: Use mod_g729
 only when freeswitch-mod-bcg729 is disabled
In-Reply-To: <20171004210224.12763-4-bernd.kuhls@t-online.de>
References: <20171004210224.12763-1-bernd.kuhls@t-online.de>
 <20171004210224.12763-4-bernd.kuhls@t-online.de>
Message-ID: <ee38a94e-cac5-f151-55cf-07b9f14119f9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-10-17 23:02, Bernd Kuhls wrote:
> mod_g729 contained in freeswitch source provides pass-through:
> https://freeswitch.org/confluence/display/FREESWITCH/mod_g729
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: no changes
> v2: no changes
> 
>  package/freeswitch/freeswitch.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> index 0adb35d751..6c1dc7c012 100644
> --- a/package/freeswitch/freeswitch.mk
> +++ b/package/freeswitch/freeswitch.mk
> @@ -116,7 +116,6 @@ FREESWITCH_ENABLED_MODULES += \
>  	applications/mod_valet_parking \
>  	applications/mod_voicemail \
>  	codecs/mod_g723_1 \
> -	codecs/mod_g729 \
>  	dialplans/mod_dialplan_asterisk \
>  	dialplans/mod_dialplan_xml \
>  	endpoints/mod_loopback \
> @@ -175,6 +174,10 @@ FREESWITCH_DEPENDENCIES += alsa-lib
>  FREESWITCH_ENABLED_MODULES += endpoints/mod_alsa
>  endif
>  
> +ifeq ($(BR2_PACKAGE_FREESWITCH_MOD_BCG729),)

 Perhaps add a comment above to explain the inverted logic:

# Build the internal G.729 passthrough module if the external one is not enabled

 Regards,
 Arnout

> +FREESWITCH_ENABLED_MODULES += codecs/mod_g729
> +endif
> +
>  ifeq ($(BR2_PACKAGE_FREETYPE),y)
>  FREESWITCH_DEPENDENCIES += freetype
>  endif
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
