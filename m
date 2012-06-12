From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Jun 2012 08:05:22 +0200
Subject: [Buildroot] [PATCH v3 1/6] target: add symbols for i386/x86_64
 cpu features
In-Reply-To: <1339328813-6269-4-git-send-email-s.martin49@gmail.com>
References: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
 <1339328813-6269-4-git-send-email-s.martin49@gmail.com>
Message-ID: <4FD6DC22.8050900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/10/12 13:46, Samuel Martin wrote:
>   config BR2_x86_geode
>   	bool "geode"
> +	# Don't include MMX support because there several variant of geode
> +	# processor, some with MMX support, some without.
> +	# See:http://en.wikipedia.org/wiki/Geode_%28processor%29
> +	select BR2_X86_CPU_HAS_3DNOW

  Maybe it makes sense to have a config BR2_x86_geode_mmx ?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
