From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Dec 2013 23:43:40 +0100
Subject: [Buildroot] [PATCHv7 2/5] core: introduce the BR2_EXTERNAL
	variable
In-Reply-To: <1386270673-16051-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386270673-16051-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386270673-16051-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52A1019C.9090605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/13 20:11, Thomas Petazzoni wrote:
> +BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
> +-include $(BR2_EXTERNAL_FILE)
> +ifeq ($(BR2_EXTERNAL),)
> +  override BR2_EXTERNAL = support/dummy-external
> +  $(shell rm -f $(BR2_EXTERNAL_FILE))
> +else
> +  $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
> +endif

  Huh, did I write this? AFAIK we don't normally indent inside make 
conditionals... And if we did, it would be with tabs.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
