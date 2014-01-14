From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Jan 2014 22:05:16 +0100
Subject: [Buildroot] [PATCH v3 2/2] ffmpeg: Add sse4 related options
	BR2_X86_CPU_HAS_SSE4 / BR2_X86_CPU_HAS_SSE4
In-Reply-To: <52D56F78.50304@mind.be> (Arnout Vandecappelle's message of "Tue, 
 14 Jan 2014 18:10:16 +0100")
References: <1388685585-23467-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP37762C5CD6B3E076E490852D9CB0@phx.gbl>
 <52D56F78.50304@mind.be>
Message-ID: <87bnzexoj7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 02/01/14 18:59, Bernd Kuhls wrote:
 >> 
 >> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 >> ---
 >> arch/Config.in.x86       |    4 ++++
 >> package/ffmpeg/ffmpeg.mk |   14 +++++++++++++-
 >> 2 files changed, 17 insertions(+), 1 deletion(-)
 >> 
 >> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
 >> index ce30605..15d5c16 100644
 >> --- a/arch/Config.in.x86
 >> +++ b/arch/Config.in.x86
 >> @@ -9,6 +9,10 @@ config BR2_X86_CPU_HAS_SSE3
 >> bool
 >> config BR2_X86_CPU_HAS_SSSE3
 >> bool
 >> +config BR2_X86_CPU_HAS_SSE4
 >> +	bool
 >> +config BR2_X86_CPU_HAS_SSE42
 >> +	bool

 >  Since nobody selects these symbols, this patch just adds dead code,
 >  right?

Yes, for now it does. I was expecting to see a followup patch adding new
CPUs. I have sse4 on my laptop atleast:

egrep 'name|sse4' /proc/cpuinfo|head -n 2
model name      : Intel(R) Core(TM) i5-3320M CPU @ 2.60GHz
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms

-- 
Bye, Peter Korsgaard
