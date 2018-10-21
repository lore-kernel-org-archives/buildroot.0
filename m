From: Mark Corbin <mark.corbin@embecosm.com>
Date: Sun, 21 Oct 2018 10:32:40 +0100
Subject: [Buildroot] [PATCH 1/1] postgresql: disable spinlock support
 for riscv64
In-Reply-To: <20181020235819.42a5206b@windsurf.lan>
References: <20181020202219.24489-1-fontaine.fabrice@gmail.com>
 <20181020235819.42a5206b@windsurf.lan>
Message-ID: <c8ceba8b-35f9-43b1-c4b9-e4fb135baa4f@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

On 20/10/2018 22:58, Thomas Petazzoni wrote:
> Hello,
>
> +Mark Corbin in Cc.
>
> On Sat, 20 Oct 2018 22:22:19 +0200, Fabrice Fontaine wrote:
>> Fixes:
>>  - http://autobuild.buildroot.org/results/deebc4b8f615e1216279d6587e91f5654da2ad68
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> -ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_nios2)$(BR2_xtensa),y)
>> +ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_nios2)$(BR2_RISCV_64)$(BR2_xtensa),y)
> Any reason for doing that only for riscv64 and not for RISC-V
> entirely ? Does PostgreSQL has a spinlock implementation for RISC-V 32
> but not RISC-V 64 ?
PostgreSQL does not have any support for RISC-V architecture, so I it?
makes sense to use BR2_riscv here instead of BR2_RISCV_64.

Regards

Mark
>
> Thanks,
>
> Thomas

-- 

*Mark Corbin*
Embedded Operating Systems Lead
Phone: +44 1590 610184?????Mobile: +44 7765 703479
Email: mark.corbin at embecosm.com
<mailto:mark.corbin@embecosm.com>?????Web: https://www.embecosm.com

Embecosm Logo

Embecosm Ltd., Palamos House #208, 66/67 High Street, Lymington, SO41
9AL, UK
Company No. 6577021 (England & Wales).
--
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181021/4451036c/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: logo.png
Type: image/png
Size: 8442 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181021/4451036c/attachment.png>
