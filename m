From: Mohamed HAMZAOUI <requinham@gmail.com>
Date: Tue, 28 Feb 2012 09:53:17 +0100
Subject: [Buildroot] [U-Boot] Craneboard with Uboot and xloader
In-Reply-To: <CABMxt4hoihH2pJk5GZ6hpt0K3Vm_Qzg8eL1ej-bFH67DOSNUqA@mail.gmail.com>
References: <CABMxt4ic6cZ_xfrtkouKkw2OWSbOiL95tXrz9XgKyqUAd4U-6A@mail.gmail.com>
 <20120224150232.GA2346@bill-the-cat>
 <CABMxt4hMc3CjnjFEQNTjzsfxyXgBoyO8uMg1xsmaTeZ2pWXRRQ@mail.gmail.com>
 <CA+M6bXk7yKi8VFQRbYT-SQZMwM9eneBzjx2NB9KpHeicxkDb9Q@mail.gmail.com>
 <CABMxt4ja3EmjER5ywn5R+OLxkXy-Ho-cZ89LLuML4qX50ews=w@mail.gmail.com>
 <CA+M6bX=A1Mie8Q093Sa3bp_hSxSRFR6z4-sNBvJP3982e_HPqQ@mail.gmail.com>
 <CABMxt4gYMf_JjfYi_2YttUL2NDNYC4974Kq_--++B2yPgf0xUg@mail.gmail.com>
 <CA+M6bXktYKXisQEiS11CNixozV7KtzwajKsXyTPNXSEOjxz3AA@mail.gmail.com>
 <CABMxt4hoihH2pJk5GZ6hpt0K3Vm_Qzg8eL1ej-bFH67DOSNUqA@mail.gmail.com>
Message-ID: <CABMxt4jZhMcZS=0P9Le3ZHO_NUJJt0Deta_Ybdd-ghdPPuGz2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Indeed, the problem is caused by selecting the ttyS0, just change it to
ttyO0 (OMAP) in the buildroot configuration and in the console env vars of
card.

Best regards
Mohamed

On Sun, Feb 26, 2012 at 1:26 AM, Mohamed HAMZAOUI <requinham@gmail.com>wrote:

> After trying to correct this issue, i have a difficult problem :( the
> booting freeze in "Starting kernel..." and it can't decompressing the
> uImage and starting the kernel.
> for information i choosed the kernel 2.6.39.4 in buildroot configuration
> with am3517_crane_defconfig file (a defconfig for version 2.6.32 that i
> copied manually) that i found in craneboard-kernel gitorious.
>
> Best regards
> Mohamed
>
>
> On Sat, Feb 25, 2012 at 3:35 PM, Tom Rini <trini@ti.com> wrote:
>
>> On Sat, Feb 25, 2012 at 6:00 AM, Mohamed HAMZAOUI <requinham@gmail.com>
>> wrote:
>> > Hi M Tom,
>> > I checked the file am3517_crane.h and it well use "rescan" instead of
>> "init"
>> >  but the problem is that after compilation, when I check the bootcmd I
>> find
>> > another one with init and not with rescan !
>> > When i tried to change the variable with the setenv command, the system
>> boot
>> >  correctly from the SD card.
>> > Can you tell me how I can fix that and why the compilation or the MLO,
>> > u-boot.img files not have the correct bootcmd ?
>>
>> Ah, how about this, you've been using the board previously, yes?  It
>> probably had a saved environment from a previous version written to
>> NAND and was using that.  You might want to try doing 'nand erase
>> 260000 20000' to erase the old environment, then reset the board to
>> get the full, new, default environment.
>>
>> --
>> Tom
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120228/600d41c5/attachment.html>
