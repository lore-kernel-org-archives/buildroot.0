From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 03 Oct 2013 18:44:36 +0200
Subject: [Buildroot] [PATCH] legal info: split manifest for host and
	target
In-Reply-To: <6e469ce45201f09b20bd.1380807778@argentina>
References: <6e469ce45201f09b20bd.1380807778@argentina>
Message-ID: <524D9EF4.9010805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/13 15:42, Thomas De Schampheleire wrote:
> Signed-off-by: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>
>
> ---
>   Makefile                     |  8 +++++---
>   docs/manual/legal-notice.txt |  6 +++---
>   package/pkg-generic.mk       |  2 +-
>   package/pkg-utils.mk         |  2 +-
>   4 files changed, 10 insertions(+), 8 deletions(-)
>
> Note: I tried hundreds of things, but couldn't find the correct way of using
> $(2)_TYPE correctly in the call to legal-manifest,

  Better not use $(2)_TYPE anyway, it's pretty much redundant.

> I can only make it work with
> $(5). I'm currently dollar-sign-dizzy:
> @$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$(call UPPERCASE,$(5)))

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
