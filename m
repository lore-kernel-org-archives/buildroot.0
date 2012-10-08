From: =?windows-1252?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 08 Oct 2012 17:46:59 +0300
Subject: [Buildroot] ALSA don't work
In-Reply-To: <5072E581.1000506@ronetix.at>
References: <506EF1E6.2090902@ronetix.at> <506EF5DD.4020307@petroprogram.com>
 <506EFDEE.5020307@ronetix.at> <506F18F6.5010506@petroprogram.com>
 <50703E2A.5060702@ronetix.at> <50704D34.2070002@petroprogram.com>
 <50716DA7.4030200@ronetix.at> <50716F47.1@ronetix.at>
 <5071A4C8.9040407@petroprogram.com> <5072BC98.6070707@ronetix.at>
 <5072D9D0.4030800@petroprogram.com> <5072E581.1000506@ronetix.at>
Message-ID: <5072E763.7010508@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

8.10.2012 17:38, Martin Peevski kirjoitti:
>>>
>>>    2. start arecord  with the command:
>>>        arecord -d 10 -t wav test68.wav       
>>>        but when I try to hear the created file with aplay nothing
>>> was heared. Next copy the test68.wav to my PC and try there aplay
>>> also nothing. Note that when I start aplay with another wav file on
>>> my target, aplay not release the console and nothing is heared
>>> again. Then I use ctrl + c to release it.
>>>
>>
>> There is also a simpler way to test wav play.
>>
>> Give command:
>>
>> speaker-test -t wav -c2
>>
>> It will play a loop of "Front Left, Front Right" untill you exit with
>> Ctrl-C
>
>
> Yes, I test the command on my PC but when I include that package for
> my target it was no on the target after build. No command speaker-test
> was available on the target. I'll try to rebuild again the Buildroot
> with that package. Any idea here?
>>

speaker-test can be found under "ALSA utils selection".
(see alsa_utils.png)

>>>
>>> Can you, please check the result from the commands and the
>>> attachments and help me turn at least aplay with ready wav files in
>>> the rootfs?
>>>
>>
>> Your alsactl init output is missing some information.
>>
>> Compare to mine:
>>
>> alsactl init
>> Found hardware: "ICH" "Sigmatel STAC9700,83,84" "AC97a:83847600"
>> "0x8086" "0x0000"
>>
>> (see also my_alsa_detection.png)
>>
>> So your alsactl init gives just your sound chip name and nothing else.
>>
>> Also, your alsamixer outputs seemed very weird and I noticed that in
>> both screenshots
>> there is no Chipset found.
>>
>> (see my version  my_alsa_mixer_settings.png)
>>
>
> OK, I will check again the output with another rootfs. I think that is
> possible the different output is due to that your looks from PC but my
> is very small Linux.
>> This is a dump question but:
>>
>> Are you *absolutely sure* that you are using the right kernel sources
>> and the right custom
>> kernel .config file for your kernel ?
>> And also are you sure that CONFIG_SND_ATMEL_AC97C=y is not needed in
>> your kernel ?
>
> Yes, with another rootfs my sound is working. I'll compare it output
> on ALSA commands with that from Buildroot.
>>
>> I still suggest you do the live running kernel config capture from
>> your working system like
>> I showed you in checking_linux_config_from_running_system.png from my
>> previous post
>> and compare it's settings to buildroot one.
>
> Yes, everything which I'm asking you is happen on my board at the moment.
>
> Thanks for the time and help!
>
> Martin

No problem at all.
Have a nice day and let me know if anything worked.

Stefan


-------------- next part --------------
A non-text attachment was scrubbed...
Name: alsa_utils.png
Type: image/png
Size: 29456 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121008/acc48e64/attachment-0001.png>
