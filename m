From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Feb 2013 18:38:08 +0100
Subject: [Buildroot] Advice on buildroot implementation
In-Reply-To: <5124AEB0.5080808@petroprogram.com>
References: <718DFA7882181D45B8BD18F31C46D55427A6A8E3@MBX204.domain.local>,
 <5124085A.1080903@mind.be>
 <718DFA7882181D45B8BD18F31C46D55427A6A997@MBX204.domain.local>
 <5124AEB0.5080808@petroprogram.com>
Message-ID: <51250A00.8020804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/02/13 12:08, Stefan Fr?berg wrote:
[snip]
> CFLAGS = -flto -fwhole-program
> LDFLAGS= -flto -fuse-linker-plugin
>
> It could be also possible to compile whole system to make it smaller but
> it is very delicate and experimental process and some packages
> don't like some flags at all (For example zlib 1.2.7 does not like
> -fwhole-program).
>
> So Im asking everyone here:
>
> How can I filter out flags-per-package ?

  For most gcc -f and -W options, there's a no- variant. So

ZLIB_CFLAGS = -fno-lto -fno-while-program
ZLIB_LDFLAGS = -fno-lto  -fno-use-linker-plugin

> And also enable flags-per-package?
> I would like to enable globally those LTO flags and filter some/all
> flags from problematic packages.

  You can only do that by changing the package .mk file. I don't think we 
want to add infrastructure for per-package CFLAGS configuration...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
