From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 05 Oct 2012 20:29:26 +0300
Subject: [Buildroot] ALSA don't work
In-Reply-To: <506EFDEE.5020307@ronetix.at>
References: <506EF1E6.2090902@ronetix.at> <506EF5DD.4020307@petroprogram.com>
 <506EFDEE.5020307@ronetix.at>
Message-ID: <506F18F6.5010506@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

5.10.2012 18:34, Martin Peevski kirjoitti:
> On 05/10/12 17:59, Stefan Fr?berg wrote:
>> Have you build your ALSA soundcard drivers as modules ?
>>
>> what does lsmod command give you ?
>>
>> have you checked files  in
>> /lib/modules/your_kernel_version_here/kernel/sound ?
>>
>> Best regards:
>> Stefan
>>
>> 5.10.2012 17:42, Martin Peevski kirjoitti:
>>> Hi, I build a Linux system with Buildroot but it don't work -
>>> impossible to start applications. This is theconsole  log:
>>>
>>> # aplay -l
>>> aplay: device_list:252: no soundcards found...
>>> [16:11:18] engineerpeevski: # alsactl init
>>> alsactl: init:1743: No soundcards found...
>>> [16:11:30] engineerpeevski: # alsaconf
>>> -sh: alsaconf: not found
>>>
>>> Also when the Kernel boots there is a message that a sound card was
>>> found and with another rootfs it works. I think that it's something in
>>> the config, can you help me, please? I work with AT91SAM9G45 SoC.
>>>
>>> Thanks in  advance, Martin!
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
> First must tell you that want to use sound only with WAV files!
>
Irrelevant. Your sound card could care less if you are playing wav, ogg,
mp3 or whatever....

> I built the Kernel with installed in it drivers NOT as modules.
>
> The lsmod command gives me the following:
> # lsmod
> Module                  Size  Used by    Not tainted
>
> That's 0 modules I think. Also have not  /lib/modules/ ...
> /kernel/sound directory because I haven't modules, I think.
>
Yes.

>
> I search in internet and find the following which claims that I must
> edit the device table in Buildroot configuration:
> http://elasticsheep.com/2011/01/adding-alsa-audio-support-to-a-buildroot-based-system/
>
> but will try it tomorrow. Is it true any way?
>
> Do I need something another special in the config except enabling the
> ALSA and needed tools from it, as alsamixet?
>
>
Well, if you really have built every driver you need in to your kernel
as built-in and not as modules then
you have to do it The Hard Way (tm).

So go ahead and create all those device nodes mentioned in that link.

I use mdev and kernel modules and could care less about having to
manually create every device node needed.
Mdev and kernel will do that automatically for me.

Best regards
Stefan

> Thanks!
>
