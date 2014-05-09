From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 09 May 2014 21:59:59 +0200
Subject: [Buildroot] [PATCH v4] toolchain-external: Fix EABIhf check
In-Reply-To: <84b0ee8257dae0a623d4.1399635840@argentina>
References: <84b0ee8257dae0a623d4.1399635840@argentina>
Message-ID: <536D33BF.7010700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/05/14 13:44, Thomas De Schampheleire wrote:
> From: Stefan S?rensen <stefan.sorensen@spectralink.com>
> 
> Currently the check for EABI/EABIhf toolchains looks for the
> Tag_ABI_VFP_args attribute in the crt1.o file which gcc adds in an
> EABIhf toolchain.
> In uClibc, however, crt1.o is not compiled from c but assembly, so the
> Tag_ABI_VFP_args attribute is not added in the object file. This causes
> the EABIhf check in the external toolchain logic to fail for
> uClibc-based toolchains.
> 
> Fix by compiling a dummy .c file and trying to link the object against the
> C library. Since it is impossible to mix EABI and EABIhf code, a mismatch
> between the buildroot and toolchain ABI settings will be detected during
> this link step.
> 
> Fixes bug #6842: https://bugs.busybox.net/show_bug.cgi?id=6842
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> [ThomasDS: do full link iso readelf test, update commit message]
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
