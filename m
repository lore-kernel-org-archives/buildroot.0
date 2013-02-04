From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Feb 2013 19:54:21 +0100
Subject: [Buildroot] [PATCH 2/7] package/pmake: add host pmake
In-Reply-To: <453ed921e8645a7271b1b67d1c05ee96819a871b.1359993560.git.yann.morin.1998@free.fr>
References: <cover.1359993560.git.yann.morin.1998@free.fr>
 <453ed921e8645a7271b1b67d1c05ee96819a871b.1359993560.git.yann.morin.1998@free.fr>
Message-ID: <511003DD.4080305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/13 17:01, Yann E. MORIN wrote:
> +	printf '#!/bin/sh\nexec %s -m %s "$$@"\n'   \
> +	       $(HOST_DIR)/usr/bin/bmake            \
> +	       $(HOST_DIR)/usr/share/pmake/mk       \
> +	       >$(HOST_DIR)/usr/bin/pmake
> +	chmod 0755 $(HOST_DIR)/usr/bin/pmake

  I should have mentioned this earlier of course, but:

  I would prefer to have a package/pmake/pmake script that discovers the 
mk path based on ${0%/*}. That immediately makes it relocatable :-)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
