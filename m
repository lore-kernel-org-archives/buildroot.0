From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 22 Feb 2016 09:51:23 -0800
Subject: [Buildroot] [PATCH v3] Update libaio to 0.3.110
In-Reply-To: <56C8ED6F.1010201@mind.be>
References: <1455824391-23524-1-git-send-email-alistair.francis@xilinx.com>
 <56C8ED6F.1010201@mind.be>
Message-ID: <CAKmqyKNyu=4NZX_Mdf7O2288On5w+CfGySsSGeCR7icGtjyqkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 20, 2016 at 2:49 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 02/18/16 20:39, Alistair Francis wrote:
>> Update libaio from 0.3.108 to 0.3.110. This adds AArch64 support.
>
>  The commit message should have mentioned that the patch is now reduced to just
> MIPS. It should also mention the upstream status of the patch. Have you sent it
> upstream?
>
>  Otherwise:
>  Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks!

I was going to send a new version with an updated commit message, but
it looks like I don't need to now. Thanks for helping me get this in.

Thanks,

Alistair

>
>  Regards,
>  Arnout
>
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>  package/libaio/0001-arches.patch | 454 ++-------------------------------------
>>  package/libaio/Config.in         |   2 +-
>>  package/libaio/libaio.hash       |   4 +-
>>  package/libaio/libaio.mk         |   2 +-
>>  4 files changed, 20 insertions(+), 442 deletions(-)
>>
>> diff --git a/package/libaio/0001-arches.patch b/package/libaio/0001-arches.patch
>> index c85568c..4b77f57 100644
>> --- a/package/libaio/0001-arches.patch
>> +++ b/package/libaio/0001-arches.patch
>> @@ -1,145 +1,28 @@
>>  Patch borrowed from OpenEmbedded, available at
>> -recipes/libaio/libaio-0.3.106/00_arches.patch in their source
>> -tree. The patch has been adapted to remove the ARM-related
>> -definitions, since they have been merged in later versions of libaio.
>> +/meta/recipes-extended/libaio/libaio/00_arches.patch in their source
>> +tree. This patch has been modified to only add the MIPS definitions.
>>
>> -The patch adds various architecture specific definitions (syscall
>> -number and macros) for m68k, MIPS, PA/RISC and Sparc. Amongst these,
>> -Buildroot mostly only cares about MIPS, but it was just easier to take
>> -the whole OpenEmbedded patch.
>> +The patch adds MIPS specific definitions (syscall number and macros).
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
