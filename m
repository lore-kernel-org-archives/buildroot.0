From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Aug 2013 18:31:09 +0200
Subject: [Buildroot] [PATCH 1 of 6 v2] Config.in.legacy: update
	description
In-Reply-To: <2942a6d3dd9f0f3fd864.1374650578@BEANTN0L019720>
References: <patchbomb.1374650577@BEANTN0L019720>
 <2942a6d3dd9f0f3fd864.1374650578@BEANTN0L019720>
Message-ID: <520A5F4D.70901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/07/13 09:22, Thomas De Schampheleire wrote:
[snip]
> +# If the old symbol is of type string, and the symbol has been renamed, you
> +# should add it as a bool with another name (BR2_<foo>_WRAP), that defaults
> +# to y if the old string is not set at its default value. For example:
> +#     config BR2_FOO_STRING
> +#             string "Some foo string"
> +# would become:
> +#     config BR2_FOO_STRING_WRAP
> +#             bool "Foo string option has been renamed."
> +#             default y if BR2_FOO_STRING != ""
> +#             depends on BR2_LEGACY

  My Ack was too hasty, this should be
	select BR2_LEGACY


  Regards,
  Arnout

> +#             help
> +#               <suitable help text>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
