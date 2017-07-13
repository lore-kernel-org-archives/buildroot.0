From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
Date: Thu, 13 Jul 2017 12:20:54 -0400
Subject: [Buildroot] [PATCH 1/1] configs/arcturus_ucp1020_defconfig
In-Reply-To: <20170713173340.47f16bde@windsurf.lan>
References: <20170712183103.30139-1-oleks@arcturusnetworks.com>
 <20170713094219.1750fab7@windsurf.orange-hotspot.com>
 <c171cf9c-b0f7-e065-e3b9-41ca3678bdff@arcturusnetworks.com>
 <20170713153809.5d51faba@windsurf.orange-hotspot.com>
 <d756418a-69f4-00a2-7aa1-e101a6289b1a@arcturusnetworks.com>
 <20170713173340.47f16bde@windsurf.lan>
Message-ID: <d52a1493-e225-d781-71f8-97af8212ba77@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Looks like we mixed two architectures:

We have arcturus_ucp1020_defconfig (board/arcturus/ppc-ucp1020) already 
in buildroot tree for a while and we been using public kernel with our 
patches.
Recently I tested the build of it and found that with latest GCC-6 we 
have an issue to build image for this existing board (uCP1020), but it 
was building OK when the latest was GCC-4.9.  I agree with you that it 
is better to port GCC-6 issue fix and use GCC-6, I already tested it 
here and will added that linux-3.18 patch  into my board patch directory.
The updated patch for uCP1020 I will send soon.

The arcturus_ucls1012a_defconfig (board/arcturus/aarch64-ucls1012a) is 
another board support package we are trying to add to buildroot now.
And in patches for this board we are using 
"BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://www.arcturusnetworks.com/OSS/kernel-ucls1012a-170706-13.tar.gz".
The v4 of the patch for uCLS1012a is waiting for your approval.

Thank you,

Oleks

On 07/13/2017 11:33 AM, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 13 Jul 2017 10:14:41 -0400, Oleksandr G Zhadan wrote:
>
>>> Then could you please backport Linux kernel commit
>>> 1e407ee3b21f981140491d5b8a36422979ca246f instead? It should fix this
>>> build issue.
>> Yes, I can, but we are using public kernel.
> Well, the kernel is downloaded from:
>
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://www.arcturusnetworks.com/OSS/kernel-ucls1012a-170706-13.tar.gz"
>
> and you work for Arcturus Networks, so I guess you could adjust your
> tarball to include the relevant patch, no?
>
>> Should I add it as an extra patches to my
>> board/arcturus/ppc-ucp1020/patches/linux/ directory ?
> If changing the tarball is not possible, then adding the patch in
> Buildroot is indeed the other option.
>
> Thanks!
>
> Thomas
