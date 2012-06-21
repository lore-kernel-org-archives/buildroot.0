From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Jun 2012 22:31:05 +0200
Subject: [Buildroot] preparing rootfs with gcc in buildroot
In-Reply-To: <jrvjm2$sls$1@dough.gmane.org>
References: <CAGXs5wVgC+e_BUAOPgvL-vGqo4pusF3iTLFz_7Fb_Jfvrvv+Hg@mail.gmail.com>
 <20120621142848.4caafde0@skate>
 <CAGXs5wXPo4wtWY9H0Ec761e0zEUCa_3u3-YH04jzZcW_m=ju+Q@mail.gmail.com>
 <jrvjm2$sls$1@dough.gmane.org>
Message-ID: <4FE38489.8060803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/21/12 18:55, Grant Edwards wrote:
> If you want to build things that use libraries that were built as part
> of buildroot, then you have to add a couple more command line options
> to tell the compiler/linker where to find the include and library
> files created by buildroot (e.g.<wherever>/output/target.

  And even that is not necessary if you use output/host/usr/bin/xxx-gcc
as the cross-compiler - that one has the sysroot hard-coded.

  By the way, you should point to <wherever>/output/staging, not
<wherever>/output/target.  target doesn't normally contain header
files or static libraries.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
