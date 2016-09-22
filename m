From: Lothar Felten <lothar.felten@gmail.com>
Date: Fri, 23 Sep 2016 00:21:42 +0200
Subject: [Buildroot] [PATCH 1/1] configs: new defconfig for TI am335x-evm
In-Reply-To: <20160921140912.29c4584e@free-electrons.com>
References: <1471261882-5640-1-git-send-email-lothar.felten@gmail.com>
 <20160918193045.15a33be3@free-electrons.com>
 <87fuotya3r.fsf@dell.be.48ers.dk>
 <20160921105303.1832ad5e@free-electrons.com>
 <87bmzhy6ci.fsf@dell.be.48ers.dk>
 <20160921121803.487035d8@free-electrons.com>
 <877fa5y1y2.fsf@dell.be.48ers.dk>
 <20160921140912.29c4584e@free-electrons.com>
Message-ID: <f297e95d-443c-06e1-3430-4ab4a752e964@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 21.09.2016 14:09, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 21 Sep 2016 12:36:21 +0200, Peter Korsgaard wrote:
>
>>  > How would you name this common configuration then?
>>
>> I would just call it beaglebone, and mention in the readme what boards
>> it works on.
>>
>> Newcomers are much more likely to have one of the beaglebone boards than
>> an evm, so naming it like that imho makes sense.
>
> OK, fine with me.
>
> Thomas
>

I changed the patches, they now update the current beaglebone, the 
defconfigs will be: beaglebone_defconfig and beaglebone_qt_defconfig.
The readme.txt lists the supported targets.

>> Uboot SD card patch:
>> Early AM335x-evm boards can only use 1 bit communication to the SD card, on
>> newer board revisions this might be fixed.
>> Forcing 1 bit communication slows down the communication but will work
>> regardless if the SD card is attached via 1 or 4 bits.
>> If the board has a working 4 bit SD card interface, this patch can be removed,
>> this will speed up the access.
>
> Do you still have those early AM335x EVM boards? Are they widespread?
> I'm wondering if it really makes sense to have this patch.

I've only use two EVMs and they both have the issue, I'm not sure that 
it ever got fixed. Any board will run in 1 bit mode, but some evms won't 
run in 4 bit mode, so I think that's a safe choice. Anyway, it applies 
to the uboot only.

>> +BR2_KERNEL_HEADERS_4_1=y
>
> Use "same headers as the kernel sources" option please.

ok

>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
>
> Does this really work for the BeagleBone, which uses ttyO2 if I
> remember correctly? Maybe another reason to have a defconfig that
> supports just the am335x_evm.

The beaglebone (ttyO0 on USB) beagleboneblack (ttyO0 on pinheader) and 
the evm (sub d 9 pin) all use ttyO0

Lothar
