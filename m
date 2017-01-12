From: paul <paul.arssov@sbcglobal.net>
Date: Thu, 12 Jan 2017 12:11:55 -0800
Subject: [Buildroot] orange-pi build not working
In-Reply-To: <959b39b2-b40e-4725-6ff7-44e26479e19a@gigabyte.getmyip.com>
References: <5876AA5C.2010904@sbcglobal.net> <87wpe1i4bv.fsf@dell.be.48ers.dk>
 <5876E124.30603@sbcglobal.net>
 <CACXmViYRiyOME4qytV0puMhMewe1A-J-24MEnkPaVKh9-=C72g@mail.gmail.com>
 <959b39b2-b40e-4725-6ff7-44e26479e19a@gigabyte.getmyip.com>
Message-ID: <5877E30B.5050600@sbcglobal.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Micha?l ,

raspberry-pi and may be your imx7 board has a 'cmdline.txt' file in the 
first fat partition where you specify - 'console=...' parameter.

However orange-pi does not have or use 'cmdline.txt' file in the first 
fat partition.
There are 3 files -
boot.scr, sun8i-orangepi-pc.dtb, zImage

Besides, the orange-pi completes successfully the very first boot. Does 
your imx7 board completes the very first boot without 'console=...' 
parameter?


Paul.


On 1/12/2017 7:14 AM, Micha?l Zweers wrote:
> Hi,
>
> Sorry if this is unhelpful but have you told your kernel to use console ?
>
> I can get the same results if  i dont set the console=... to uart in
> boot argument on my imx7 board.
>
> kind regards,
> Micha?l
>
>
> On 12-1-2017 09:36, Peter Korsgaard wrote:
>> Hi,
>>
>> Please keep the buildroot list in CC so others can help as well.
>>
>>
>>>> So no output at all after this? It sounds like your kernel image has
>>>> somehow gotten corrupted. How did you reboot?
>>>
>>> I did multiple builds with 4.8 and 4.9 kernels - same result. The
>>> original/initial kernel is not corrupted because it boots ok.
>>> I did reboot by either -
>>> # reboot
>>> or, disconnect/connect power
>>> While power off/on may corrupt the sd card, 'reboot' cmd should not.
>>
>> Funky, how are you powering the boards?
>>
>>> People did report on the list of functioning orange-pi-pc and orange-pi-one
>>> boards.
>>> How did they find the boards working?
>>
>> I do have an orangepi-pc board stacked away here, and it did work in
>> the past. I'll try to find time this weekend to retest.
>>
>
> ---
> This email has been checked for viruses by Avast antivirus software.
> https://www.avast.com/antivirus
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
