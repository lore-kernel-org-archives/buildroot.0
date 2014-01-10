From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Jan 2014 07:51:22 +0100
Subject: [Buildroot] [PATCH 1 of 5 v3] deprecated handling: introduce
 BR2_DEPRECATED_SINCE_xxxx_xx
In-Reply-To: <14cfc9f6c9b34dc82c58.1388764970@argentina>
References: <patchbomb.1388764969@argentina>
 <14cfc9f6c9b34dc82c58.1388764970@argentina>
Message-ID: <52CF986A.9010604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/01/14 17:02, Thomas De Schampheleire wrote:
> In order to keep better track of when a feature got deprecated, and hence
> when it can be removed, a new set of symbols BR2_DEPRECATED_SINCE_xxxx_xx is
> introduced. These symbols are automatically selected when BR2_DEPRECATED is
> selected, and thus are transparent to the user.
> A deprecated feature will no longer depend on BR2_DEPRECATED directly, but
> rather on the appropriate BR2_DEPRECATED_SINCE_xxxx_xx. If that symbol does
> not yet exist, it has to be created in Config.in.
> When removing a deprecated feature, one should also check whether this was
> the last feature using the BR2_DEPRECATED_SINCE_xxxx_xx symbol, in which
> case the latter can be removed from Config.in.
>
> A followup patch will make sure the overview is added to the list of
> deprecated features in the manual, so that a buildroot core developer can
> easily determine which features to remove in a given development cycle.
>
> Signed-off-by: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>

  At first I was afraid of the complexity added by this patch, but it's 
actually not that bad. Therefore:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
