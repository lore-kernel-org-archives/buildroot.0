From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 17 Aug 2020 23:59:27 +0200
Subject: [Buildroot] OpenSSH login problem
In-Reply-To: <CA+h8R2qO01wwrEJdTx2puEbDv6mv31YxyAjG5nCn6hosPAW_aQ@mail.gmail.com>
References: <cc86bfd55f944197bcd610626edecf2f@go-sys.de>
 <52-5f356200-5-2c492440@36238474>
 <4d943f9a8e974a60a5167db44bce6cd1@go-sys.de>
 <CA+h8R2oi0GRLYdumQOYxwON=xd7p_8pn+WoknjRd5N24Vr_5KQ@mail.gmail.com>
 <20200816220620.65159d1d@windsurf.home>
 <CA+h8R2qO01wwrEJdTx2puEbDv6mv31YxyAjG5nCn6hosPAW_aQ@mail.gmail.com>
Message-ID: <044bdcc1-7a21-66b8-bbaa-5749ae198d40@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

Le 17/08/2020 ? 23:36, Christian Stewart a ?crit?:
> Hi Thomas, all,
> 
> On Sun, Aug 16, 2020 at 1:06 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>> On Sun, 16 Aug 2020 12:59:02 -0700
>> Christian Stewart <christian@paral.in> wrote:
>>
>>> FWIW I actually had the same, was trying to test an odroid XU4 and the
>>> SSH server was immediately closing the connection. I double-checked
>>> that openssh was at the latest version & I was on the latest buildroot
>>> master as well, and assumed at the time it must have had something to
>>> do with the kernel bump I was testing.
>>>
>>> Now I'm thinking maybe this was causing it. Will test again later today.
>>
>> Could you try applying:
>>
>>  https://github.com/openssh/openssh-portable/commit/beee0ef61866cb567b9abc23bd850f922e59e3f0
>>  https://github.com/openssh/openssh-portable/commit/69298ebfc2c066acee5d187eac8ce9f38c796630
>>
>> and see if it helps ?
> 
> Tests run against buildroot master - at commit hash:
> 
> 1396b06a1ee9a86055488de593be93ae2585ceb1
> 
> == Test 1: pi3 w/ gcc 10 glibc binutils 2.34
> 
> PASS - defconfig:
> 
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_ARM_FPU_NEON_VFPV4=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> BR2_BINUTILS_VERSION_2_34_X=y
> BR2_GCC_VERSION_10_X=y
> 
> openssh works as expected.
> 
> == Test 2: odroid xu4 with gcc 9, binutils 2.33.1
> 
> have not had a chance to test yet but this was the one that didn't work before.
> 
> BR2_arm=y
> BR2_cortex_a15_a7=y
> BR2_ARM_FPU_NEON_VFPV4=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y

I did a new test [1] in the Buildroot testsuite for openssh with a glibc
internal toolchain to check if the issue with gcc 10 and openssh 8.1 is fixed [2].

Can you test again ?

[1]
http://patchwork.ozlabs.org/project/buildroot/patch/20200817215545.8271-1-romain.naour at gmail.com/
[2] https://bugs.archlinux.org/task/65386

Best regards,
Romain

> 
> 
> best regards,
> Christian
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
