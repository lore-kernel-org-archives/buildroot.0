From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Oct 2012 22:59:50 +0200
Subject: [Buildroot] [PATCH 12/12] arptables: add new package
In-Reply-To: <1350909989-1012-12-git-send-email-gustavo@zacarias.com.ar>
References: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
 <1350909989-1012-12-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <508856C6.1060504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/10/12 14:46, Gustavo Zacarias wrote:
[snip]
> +ARPTABLES_VERSION = 0.0.3
> +ARPTABLES_VERSION_MINOR = 4
> +ARPTABLES_SOURCE = arptables-v$(ARPTABLES_VERSION)-$(ARPTABLES_VERSION_MINOR).tar.gz
> +ARPTABLES_SITE =http://downloads.sourceforge.net/project/ebtables/arptables/arptables-v$(ARPTABLES_VERSION)

  We usually put
ARPTABLES_VERSION_MAJOR = v0.0.3
ARPTABLES_VERSION = $(ARPTABLES_VERSION_MAJOR)-4
ARPTABLES_SITE =http://downloads.sourceforge.net/project/ebtables/arptables/arptables-$(ARPTABLES_VERSION_MAJOR)

(_SITE is at its default value)

  I can't say if that's really better, though :-)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
