From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Oct 2012 15:29:21 +0200
Subject: [Buildroot] [PATCH] beecrypt: enable OpenMP if Buildroot GCC
 supports it
In-Reply-To: <50796BDA.3040008@petroprogram.com>
References: <1350071690-11279-1-git-send-email-stefan.froberg@petroprogram.com>
 <50793478.1090305@mind.be> <50796BDA.3040008@petroprogram.com>
Message-ID: <50796CB1.8040106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/10/12 15:25, Stefan Fr?berg wrote:
> And the automatic detection didn't work for Alexander and he was even
> using the internal toolchain

  The automatic detection did work (and it's part of autoconf, BTW).  However,
beecrypt uses the OPENMP_CFLAGS given by autoconf to determine if OpenMP is
available or not - but OPENMP_CFLAGS may be empty if OpenMP is already enabled
without any CFLAGS.  So it should instead check on ac_cv_prog_c_openmp.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
