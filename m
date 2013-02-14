From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Feb 2013 07:48:21 +0100
Subject: [Buildroot] [PATCH 3/9] manual: sprinkle with some calls to
	MESSAGE
In-Reply-To: <6aee23c2362a6fe3b8428805af5330f388e2b3aa.1360795941.git.s.martin49@gmail.com>
References: <cover.1360795941.git.s.martin49@gmail.com>
 <6aee23c2362a6fe3b8428805af5330f388e2b3aa.1360795941.git.s.martin49@gmail.com>
Message-ID: <511C88B5.8060204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/13 23:59, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Doesn't hurt to include it in 2013.02.

  Regards,
  Arnout

> ---
>   docs/manual/manual.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index d664603..aa20534 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -18,7 +18,7 @@ $(1): $(1)-$(3)
>   $(1)-$(3): $$(O)/docs/$(1)/$(1).$(4)
>
>   $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt $$($(call UPPERCASE,$(1))_SOURCES)
> -	@echo "Generating $(5) $(1)..."
> +	@$(call MESSAGE,"Generating $(5) $(1)...")
>   	$(Q)mkdir -p $$(@D)
>   	$(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
>   	  -D $$(@D) $$<
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
