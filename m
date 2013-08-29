From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Aug 2013 18:36:30 +0200
Subject: [Buildroot] [PATCH 2 of 9 v3] Config.in.legacy: update
	description for users
In-Reply-To: <059f93a8442115bd3455.1377781157@argentina>
References: <patchbomb.1377781155@argentina>
 <059f93a8442115bd3455.1377781157@argentina>
Message-ID: <521F788E.8080407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/29/13 14:59, Thomas De Schampheleire wrote:
> This patch clarifies the message shown to users in the legacy menu.
> It explicitly mentions the need to save the configuration before disabling the
> legacy options.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
>
> (v3): new patch in this series
>
>   Config.in.legacy |  19 +++++++++++++++----
>   1 files changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -69,11 +69,22 @@ menu "Legacy config options"
>
>   if BR2_LEGACY
>   comment "Your old configuration uses legacy options that no  "
> -comment "longer exist in buildroot.                          "
> -comment "Please look at the options which have been selected "
> -comment "and read their help text.                           "
> -comment "As long as these options stay selected, the build   "
> +comment "longer exist in buildroot, as indicated in the menu "
> +comment "below. As long as these options stay selected, or in"
> +comment "case of string options are non-empty, the build     "
>  comment "will fail.                                          "
> +comment "Where possible, an automatic conversion from old to "
> +comment "new symbols has been performed. Please inspect the  "

  I think the first sentence of this paragraph ("Where possible...") 
should go at the beginning of the next paragraph, where you explain about 
the automatic conversion. Or maybe the other way round: the rest of this 
paragraph should go after the full explanation of the automatic conversion.

  Also, since the text has become so long, I think some vertical 
whitespace would be appropriate. But if empty lines don't work, that 
becomes difficult... One (barely acceptable) work-around I could find is 
to insert *** at the beginning of every line. But that makes the 
already-narrow text even more narrow...



> +comment "options selected below, read their help texts, and  "
> +comment "verify/update the new configuration in the          "
> +comment "corresponding configuration menus.                  "

  You could add: "Once you have removed all legacy options, this text 
will disappear."


  Regards,
  Arnout


> +comment "Before making any change in this legacy menu, make  "
> +comment "sure to exit the configuration editor a first time  "
> +comment "and save the configuration. Otherwise, the automatic"
> +comment "conversion of symbols will be lost. After the       "
> +comment "initial save and the verification of the new        "
> +comment "configuration, you can disable the legacy options in"
> +comment "the menu below.                                     "
>   comment "Note: at some point in the future, the oldest legacy"
>   comment "options will be removed, and configuration files    "
>   comment "that still have those options set, will fail to     "
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
