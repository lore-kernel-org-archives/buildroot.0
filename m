From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 30 Nov 2017 11:15:05 +0100
Subject: [Buildroot] [PATCH 3/3] musl: enable or1k architecture
In-Reply-To: <20171130085753.3391e458@windsurf.home>
References: <20171130060027.GA25417@waldemar-brodkorb.de>
 <20171130085753.3391e458@windsurf.home>
Message-ID: <B37F3F41-3ABB-459F-8E4C-A4FB53BC68D1@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Am 30.11.2017 um 08:57 schrieb Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> 
> Hello,
> 
>> On Thu, 30 Nov 2017 07:00:28 +0100, Waldemar Brodkorb wrote:
>> With Linux kernel >= 4.13.x musl or1k can be used
>> with Qemu.
>> 
>> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> Could you clarify why it was not possible to use musl on or1k with
> kernels < 4.13 ?
> 
> Was it just a limitation of the or1k support causing runtime issues ? A
> build problem ?
> 
> I.e, I'm wondering if we should just enable or1k like you did, or if we
> should make it conditional on the kernel headers being >= 4.13.

It was a runtime issue, panic of init.
Not sure which commit fixed it. I think 
it was a qemu specific problem, that means it might have worked on real hardware with older kernels.

Or nobody ever tested musl or1k on real hardware ?.
I know that Rich only tested the musl port with qemu-user, not with qemu-system.

best regards
 Waldemar 
