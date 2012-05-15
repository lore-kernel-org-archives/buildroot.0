From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 May 2012 00:33:27 +0200
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: disable decimal
	floats
In-Reply-To: <1337116550-12175-1-git-send-email-yann.morin.1998@free.fr>
References: <1337116550-12175-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <4FB2D9B7.6050705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/15/12 23:15, Yann E. MORIN wrote:
> Decimal floats were introduced circa gcc-4.2 or -4.3, and requires
> the floating-point environement fenv.h in the C library.
>
> The uClibc .config file used by crosstool-NG to build uClibc is the
> same as used by the internal buildroot mechanism, and explcitly
> disables fenv support.
>
> The quick workaround is to simply disable decimal floats in all
> crosstool-NG config files.

  Wouldn't it be better to enable FENV in buildroot's uClibc config?

  I remember there were some packages that had problems with it too.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
