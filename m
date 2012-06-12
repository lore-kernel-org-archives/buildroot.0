From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Jun 2012 08:15:01 +0200
Subject: [Buildroot] [PATCH v3 2/6] target: add symbols for PowerPC cpu
 features
In-Reply-To: <1339328813-6269-5-git-send-email-s.martin49@gmail.com>
References: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
 <1339328813-6269-5-git-send-email-s.martin49@gmail.com>
Message-ID: <4FD6DE65.8080103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/10/12 13:46, Samuel Martin wrote:
> +# PowerPC cpu features
> +config BR2_POWERPC_CPU_G3
> +	bool
> +config BR2_POWERPC_CPU_G4
> +	bool
> +config BR2_POWERPC_CPU_G5
> +	bool

  I was expecting Altivec here, not the PowerPC CPU generations...  These CPU
features are relevant mostly to allow libraries to select optimized assembly
code, and I don't see much use of G5-specific assembly.  And anyway, the
-mcpu options for a particular CPU are already passed by buildroot.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
