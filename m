From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Nov 2012 23:57:02 +0100
Subject: [Buildroot] [PATCH 02/23] manual: make clean target consistent
 with others in buildroot
In-Reply-To: <1352639701-27829-3-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
 <1352639701-27829-3-git-send-email-s.martin49@gmail.com>
Message-ID: <50A02D3E.8060701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/12 14:14, Samuel Martin wrote:
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index 1eaf73a..83d2fcb 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -38,10 +38,10 @@ $(call GENDOC_INNER,$(1),chunked,split-html,chunked,Split HTML)
>   $(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
>   $(call GENDOC_INNER,$(1),text,txt,text,Text)
>   $(call GENDOC_INNER,$(1),epub,epub,epub,EPUB)
> -clean: clean-$(1)
> -clean-$(1):
> +clean clean-$(1): $(1)-clean

  I think you can safely remove clean-$(1) - or should we consider this API?

  Regards,
  Arnout

> +$(1)-clean:
>   	$(Q)$(RM) -rf $(O)/docs/$(1)
> -.PHONY: $(1) clean-$(1)
> +.PHONY: $(1) $(1)-clean
>   endef
>
>   MANUAL_SOURCES = $(wildcard docs/manual/*.txt) $(wildcard docs/images/*)

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
