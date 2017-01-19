From: paul <paul.arssov@sbcglobal.net>
Date: Thu, 19 Jan 2017 07:06:33 -0800
Subject: [Buildroot] orange-pi build not working
In-Reply-To: <5877E30B.5050600@sbcglobal.net>
References: <5876AA5C.2010904@sbcglobal.net> <87wpe1i4bv.fsf@dell.be.48ers.dk>
 <5876E124.30603@sbcglobal.net>
 <CACXmViYRiyOME4qytV0puMhMewe1A-J-24MEnkPaVKh9-=C72g@mail.gmail.com>
 <959b39b2-b40e-4725-6ff7-44e26479e19a@gigabyte.getmyip.com>
 <5877E30B.5050600@sbcglobal.net>
Message-ID: <5880D5F9.8040403@sbcglobal.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi ,

I did find a solution to the one time boot for 'orange pi' boards.
In order to keep booting I did change through the build-root config -
- select 'linux headers' as '4.7.x'
- select 'kernel' as '4.7'

I made a build and did test - successfully booting multiple times.

Why do the builds with newer 4.8 and 4.9 kernels boot only 1 time?

I did not find the exact reason but here are some hypotheses -
- u-boot documentation (pretty old-2007) mentions 'boot-count' 
parameter, used in making u-boot, and passing it to kernel
- u-boot documentation provides a source of a kernel driver to modify 
boot count through the '/proc' ;


Paul.


On 1/12/2017 12:11 PM, paul wrote:
> Hello Micha?l ,
>
> raspberry-pi and may be your imx7 board has a 'cmdline.txt' file in the
> first fat partition where you specify - 'console=...' parameter.
>
> However orange-pi does not have or use 'cmdline.txt' file in the first
> fat partition.
> There are 3 files -
> boot.scr, sun8i-orangepi-pc.dtb, zImage
>
> Besides, the orange-pi completes successfully the very first boot. Does
> your imx7 board completes the very first boot without 'console=...'
> parameter?
>
>
> Paul.
>
>
> On 1/12/2017 7:14 AM, Micha?l Zweers wrote:
>> Hi,
>>
>> Sorry if this is unhelpful but have you told your kernel to use console ?
>>
>> I can get the same results if  i dont set the console=... to uart in
>> boot argument on my imx7 board.
>>
>> kind regards,
>> Micha?l
>>
>>
>> On 12-1-2017 09:36, Peter Korsgaard wrote:
>>> Hi,
>>>
>>> Please keep the buildroot list in CC so others can help as well.
>>>
>>>
>>>>> So no output at all after this? It sounds like your kernel image has
>>>>> somehow gotten corrupted. How did you reboot?
>>>>
>>>> I did multiple builds with 4.8 and 4.9 kernels - same result. The
>>>> original/initial kernel is not corrupted because it boots ok.
>>>> I did reboot by either -
>>>> # reboot
>>>> or, disconnect/connect power
>>>> While power off/on may corrupt the sd card, 'reboot' cmd should not.
>>>
>>> Funky, how are you powering the boards?
>>>
>>>> People did report on the list of functioning orange-pi-pc and
>>>> orange-pi-one
>>>> boards.
>>>> How did they find the boards working?
>>>
>>> I do have an orangepi-pc board stacked away here, and it did work in
>>> the past. I'll try to find time this weekend to retest.
>>>
>>
>> ---
>> This email has been checked for viruses by Avast antivirus software.
>> https://www.avast.com/antivirus
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
