From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 May 2019 13:17:48 +0200
Subject: [Buildroot] Reg: Valgrind support for Aarch64 in buildroot
 2019.02.02
In-Reply-To: <CAAMHf5EEeW7j=tvj8hWanzdoKT0mae=85HF_D+OBFVHcF4oYjQ@mail.gmail.com>
References: <CAAMHf5EaMVDS23JXv-4_yWByHnn=0xT+iOKdVOhan5Ah4EvbLw@mail.gmail.com>
 <20190430085653.0bd4914e@windsurf>
 <CAAMHf5EEeW7j=tvj8hWanzdoKT0mae=85HF_D+OBFVHcF4oYjQ@mail.gmail.com>
Message-ID: <94d81bb6-7fc8-85bb-cf4b-21f3101d0b13@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/04/2019 13:34, ravi chandran wrote:
> checking for a supported CPU... no (arm)
> configure: error: Unsupported host architecture. Sorry?
> 
> valgrind-3.14.0 is what the version configured to use in valgrind.mk
> <http://valgrind.mk>. I am not sure if this particular version will support arm32.
> 
> config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
> ? ? ? ? bool
> ? ? ? ? default y if BR2_aarch64
> ? ? ? ?+ default y if BR2_arm
> ? ? ? ? default y if BR2_ARM_CPU_ARMV7A
                       ^^^^^^^^^^^^^^^^^^
 As you can see, valgrind does support arm32, but only ARMv7-A (i.e. Cortex-A
class CPUs).

 It might also support ARMv8 in 32-bit mode, however. Note that you'll need to
adapt the rewriting of GNU_TARGET_NAME in valgrind.mk if you want to try that.

 Regards,
 Arnout


> ? ? ? ? # MIPS32 R6 is unsupported
> ? ? ? ? default y if BR2_mips && !BR2_mips_32r6
> ? ? ? ? default y if BR2_mipsel && !BR2_mips_32r6
> 
> Thanks,
> Ravi
