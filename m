From: Mark Corbin <mark.corbin@embecosm.com>
Date: Wed, 3 Oct 2018 11:53:54 +0100
Subject: [Buildroot] Custom C Libraries for RISC-V 32-bit Support
In-Reply-To: <20181003104024.ijzjzu6t4sp7cee3@sapphire.tkos.co.il>
References: <37c3dc75-0145-ce92-05c0-6c9559b86022@embecosm.com>
 <20181003104024.ijzjzu6t4sp7cee3@sapphire.tkos.co.il>
Message-ID: <a20fc000-76ef-da38-b7d7-2fb185fe88d5@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch

On 03/10/18 11:40, Baruch Siach wrote:
> Hi Mark,
>
> On Wed, Oct 03, 2018 at 11:26:53AM +0100, Mark Corbin wrote:
>> I've been asked by a few people about adding RISC-V 32-bit support to
>> Buildroot.
>>
>> This would require the ability to select custom git repositories for C
>> libraries. There is a glibc repository based on v2.26 that works for
>> riscv32 and there is also a musl repository for riscv32/riscv64 that I'd
>> like to test.
>>
>> I'm happy to add support for custom C libraries, but was wondering what
>> everybody's thoughts were on this?
> We already support a custom version of glibc for the ARC architecture. See 
> package/glibc/glibc.mk. Is there a plan to push upstream musl/glibc support 
> for RISC-V 32-bit?
It looks like the musl patches have been submitted for review[1]. I'm
not sure about the status of glibc 32-bit support.

I could add custom library support as per the ARC architecture, or I
could add a generic way to specify a git repository like the kernel, or
I could try to produce some patch sets against the latest C library
versions. I'm open to suggestions.

Regards

Mark

[1] https://www.openwall.com/lists/musl/2018/09/28/1
>
> baruch
>

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181003/0910bb2f/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: logo.png
Type: image/png
Size: 8442 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181003/0910bb2f/attachment.png>
