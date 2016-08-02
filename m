From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 2 Aug 2016 12:18:45 +0900
Subject: [Buildroot] [PATCH 2/2] zynq: document how to use custom
	ps7_init files
In-Reply-To: <CANQCQpafdque6ZjOJ=SgfP+aqUg=BpfQMR2d3aavdTd9-o_xNg@mail.gmail.com>
References: <1469943791-4805-1-git-send-email-yamada.masahiro@socionext.com>
 <1469943791-4805-3-git-send-email-yamada.masahiro@socionext.com>
 <CANQCQpafdque6ZjOJ=SgfP+aqUg=BpfQMR2d3aavdTd9-o_xNg@mail.gmail.com>
Message-ID: <CAK7LNAQSEcyPNSOrOxVV2WmW564=ZXZXGQJXnkbh7Yv+5GF2AQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

Thanks for your comments!


2016-08-02 11:10 GMT+09:00 Matthew Weber <matthew.weber@rockwellcollins.com>:
> Masahiro,
>
> On Sun, Jul 31, 2016 at 12:43 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Since U-Boot supported SPL for Zynq boards at v2014.04 release, it
>> became much easier to build a system.  At that time, however, users
>> still needed to manually copy ps7_init.c/h to the U-Boot source tree
>> to generate a working SPL image because ps7_init.c/h output from
>> Xilinx tools are not compatible with GPL.
>>
>> Later, the license problem was solved when Xilinx tools became able
>> to output the GPL-compatible variants (ps7_init_gpl.c/h) as well.
>> U-Boot v2015.07 or later includes ps7_init_gpl.c/h for major Zynq
>> boards so that users can build a boot image straight away.
>>
>> Now Buildroot supports 3 boards (Zedboard, MicroZed, ZC706) without
>> any manual intervention.  This is a good thing itself, but commit
>> b9cd72cdbfe3 ("zynq_zc706: bump U-Boot to xilinx-v2016.2") entirely
>> dropped the information about custom ps7_init files.
>>
>> This commit provides up-to-date guidance for how to customize the
>> ps7_init files.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>>  board/zynq/readme.txt | 44 +++++++++++++++++++++++++++++++++++++-------
>>  1 file changed, 37 insertions(+), 7 deletions(-)
>>
>> diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
>> index 51e28b6..debb163 100644
>> --- a/board/zynq/readme.txt
>> +++ b/board/zynq/readme.txt
>> @@ -6,13 +6,6 @@ Currently, three boards are natively supported by Buildroot:
>>   - Avnet ZedBoard (zynq_zed_defconfig)
>>   - Avnet MicroZed (zynq_microzed_defconfig)
>
> Did you mean to remove the previous two lines?


No.  '-' is for itemization.



>>
>> -The following build procedure focuses on them, but you can adjust it to your
>> -board even if it is not listed above.  Major Zynq-based boards are supported by
>> -U-Boot, and their Device Trees are merged in Linux Kernel.  If your board is the
>> -case, booting the kernel is a piece of cake.  All you need to do is to change:
>> - - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
>> - - U-Boot board defconfig (BR2_TARGET_UBOOT_BOARD_KCONFIG)
>> -
>>  Steps to create a working system for a Zynq board:
>>
>>  1) Configuration (do one of the following)
>> @@ -50,3 +43,40 @@ References:
>>
>>   - Zedboard/Microzed information including schematics, reference designs, and
>>     manuals are available from http://www.zedboard.org .
>
> Did you mean to remove this line?

Not at all.
I think the patch format is not broken
because this was sent by "git send-email".


> Otherwise looks good, care to update for a v2?



I am OK with all the suggestions for reword.


If you do not mind, I'd like to hand over this to you.
Could you rephrase them in a way you think better, and send v2 please?

I am not a native English speaker and I believe you will do a better job.



-- 
Best Regards
Masahiro Yamada
