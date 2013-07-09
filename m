From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 9 Jul 2013 11:54:31 -0500
Subject: [Buildroot] Cape firmware in /lib/firmware
In-Reply-To: <CA+-urNT-Pj3mWEucVW5uCdD-nsdFRUVDm+0YismGjTCwsYW_Dg@mail.gmail.com>
References: <CA+-urNSTk=U5uOCSnmPLd0iziW7Lh_HTb9Zb+eR2aaBByi=WtQ@mail.gmail.com>
 <CAEBucnBRDa2CZ2RDBtkX3rT=d57bcVaGnsxvh6X1-QJTchs-MQ@mail.gmail.com>
 <CA+-urNT-Pj3mWEucVW5uCdD-nsdFRUVDm+0YismGjTCwsYW_Dg@mail.gmail.com>
Message-ID: <CAEBucnB3FH5eaB6HHOJ-ZB9N2W-oj7M49c9JuzPzLxADo61T3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 9, 2013 at 11:28 AM, Frank Hunleth
<fhunleth@troodon-software.com> wrote:
> Hi Spenser,
>
> On Tue, Jul 9, 2013 at 11:22 AM, Spenser Gilliland
> <spenser@gillilanding.com> wrote:
>> Hi Frank,
>>
>> I'm respond to the mailing list as many people could find this
>> information useful.
>>
>>> I just double checked whether the eMMC would work when the cape dtbos
>>> were not compiled into the kernel (I was also trying out your patches
>>> too), and it's not looking like it is working.
>>>
>>> Just to make sure that we're doing the same thing, I assume that you have:
>>>
>>> # CONFIG_FIRMWARE_IN_KERNEL is not set
>>>
>>> in your kernel config. Do you have any other changes? As far as I can
>>> tell, the dtbos are installed correctly.
>>
>> Unfortunately, I have the CONFIG_FIRMWARE_IN_KERNEL set to y.  So, I
>> am not actually performing the firmware loads as I had thought.  Thank
>> you for pointing me towards this issue.
>>
>>> To be honest, I don't understand how eMMC is working for you if you
>>> don't build cape-bone-2g-emmc1.dtbo into the kernel. It seems like the
>>> firmware request just comes too early.
>>>
>>> Anyway, if it does work, I'd like to change my setup to more closely
>>> mirror yours since having the dtbos not compiled into the kernel seems
>>> like the right way to go.
>>
>> So, If I disable CONFIG_FIRMWARE_IN_KERNEL option and boot from the
>> sdcard.  The following firmware loading is observed but only slot-5 is
>> successfully loaded.
>
> Ok. The output that I see is identical to what you posted, so at least
> we're seeing the same thing.
>
> I'm going to keep the firmware compiled into the kernel for a while
> longer and then circle back after I make progress in other areas. As
> far as I can tell, Debian doesn't include the dtbos in the kernel and
> it works, so there must be a way to fix this.
>
> Frank

The only way to boot from eMMC would be to use an initramfs with the
dtbos.  A circular dependency would be created otherwise. Therefore,
the Debian kernel is probably booting with an initramfs. Since the
initramfs would be available very early during boot, request firmware
is able to work.  Therefore, perhaps you should try booting from and
initramfs?

Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
