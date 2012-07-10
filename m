From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2012 08:11:34 +0200
Subject: [Buildroot] [PATCH v4 1/5] target: add symbols for i386/x86_64
 cpu features
In-Reply-To: <1341528156-4197-2-git-send-email-s.martin49@gmail.com>
References: <1341528156-4197-1-git-send-email-s.martin49@gmail.com>
 <1341528156-4197-2-git-send-email-s.martin49@gmail.com>
Message-ID: <4FFBC796.9030204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/06/12 00:42, Samuel Martin wrote:
[snip]
> +config BR2_X86_CPU_HAS_SSE41
> +	bool
> +config BR2_X86_CPU_HAS_SSE42
> +	bool
> +config BR2_X86_CPU_HAS_SSE4
> +	bool
> +config BR2_X86_CPU_HAS_SSE4A
> +	bool

  I don't like these SSE4 configs which are not selected by anything.  I understand
that you need them for OpenCV, but it's not ideal.

  Maybe we need an extra subarchitecture config option to explicitly enable these?
They should depend on core2 || barcelona, probably.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
