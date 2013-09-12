From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Sep 2013 23:05:18 +0200
Subject: [Buildroot] [PATCH 2/3] Add support for BR2_EXTERNAL
In-Reply-To: <OF916AAFB6.8E78891C-ON86257BE3.000A49F0-86257BE3.000B5AF0@rockwellcollins.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF916AAFB6.8E78891C-ON86257BE3.000A49F0-86257BE3.000B5AF0@rockwellcollins.com>
Message-ID: <52322C8E.7010501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/13 04:03, rjbarnet at rockwellcollins.com wrote:
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on
> 09/08/2013 08:15:28 AM:
>
>  >
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  > ---
>  >  Config.in   |  6 ++++--
>  >  Makefile    | 29 +++++++++++++++++++++++++----
>  >  docs/manual/manual.mk |  2 +-
>
> One idea that I have, is for the make file that is genreated for the an
> external output directory, if we could preserve the the value of
> BR2_EXTERNAL
> as follows.

  Thomas's patch already does that, because BR2_EXTERNAL is stored in the 
config file.

> I don't think my logic is fully there but there is more of a
> sudo implementation:
>
> diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
> --- a/support/scripts/mkmakefile
> +++ b/support/scripts/mkmakefile
> @@ -27,6 +27,7 @@ makedir := \$(dir \$(call lastword,\$(MAKEFILE_LIST)))
>
>   MAKEARGS := -C $1
>   MAKEARGS += O=\$(if \$(patsubst
> /%,,\$(makedir)),\$(CURDIR)/)\$(patsubst %/,%,\$(makedir))
> +MAKEARGS += BR2_EXTERNAL=\$(realpath \$(BR2_EXTERNAL))
>
>   MAKEFLAGS += --no-print-directory
>
> Again this is only a suggestion but otherwise I'll ack the patchset.
>
> Thanks,
> -Ryan
>
> -------------------------------------------------------------------------
> 	*Ryan J Barnett* / Software Engineer / Platform SW
> MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
> Phone: 319-263-3880 / VPN: 263-3880 _
> __rjbarnet at rockwellcollins.com_ <mailto:rjbarnet@rockwellcollins.com>_
> __www.rockwellcollins.com_ <http://www.rockwellcollins.com/>
>
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
