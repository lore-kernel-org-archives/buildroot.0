From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Nov 2017 20:27:38 +0100
Subject: [Buildroot] [PATCH 1/4] kvm-unit-test: x86-64 variant only
 available on x86-64 hosts
In-Reply-To: <687901ac-c7d7-81bb-944b-b2c860f90bae@mind.be> (Arnout
 Vandecappelle's message of "Sun, 5 Nov 2017 16:44:52 +0100")
References: <20171102104520.29257-1-peter@korsgaard.com>
 <20171102104520.29257-2-peter@korsgaard.com>
 <687901ac-c7d7-81bb-944b-b2c860f90bae@mind.be>
Message-ID: <87k1z41q6t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 02-11-17 11:45, Peter Korsgaard wrote:
 >> We use the host compiler for x86-64 builds, so ensure it is only available
 >> on x86-64 hosts.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/kvm-unit-tests/Config.in | 1 +
 >> 1 file changed, 1 insertion(+)
 >> 
 >> diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
 >> index d0d9e2ef96..8b7908eee9 100644
 >> --- a/package/kvm-unit-tests/Config.in
 >> +++ b/package/kvm-unit-tests/Config.in
 >> @@ -15,6 +15,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 >> # x86-64 we use the host gcc (see .mk file for details)
 >> depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || !BR2_i386
 >> depends on BR2_HOST_GCC_AT_LEAST_4_5 || !BR2_x86_64
 >> +	depends on BR2_HOSTARCH = "x86_64" || !BR2_x86_64

 >  I don't think this is correct: it will also build correctly for x86_64 if the
 > host is i386, because it uses -m32 (which is the reason to use the host compiler
 > instead of the target compiler).

But some parts of kvm-unit-tests presumably are 64bit when building for
x86-64, which wouldn't work when using the host compiler on a x86
system, right? I don't think x86 system compilers are 32/64bit multilib.

But I haven't actually used a x86 distribution in the last 10 years or
so, so perhaps I'm missing something?

-- 
Bye, Peter Korsgaard
