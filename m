From: W.P. <laurentp@wp.pl>
Date: Wed, 20 Feb 2013 00:16:39 +0100
Subject: [Buildroot] Can I make USB sound card be available over BT? How?
In-Reply-To: <5123EE76.6020205@mind.be>
References: <51216E27.2010508@wp.pl> <5123EE76.6020205@mind.be>
Message-ID: <512407D7.6010501@wp.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U?ytkownik Arnout Vandecappelle napisa?:
> On 18/02/13 00:56, W.P. wrote:
>> Hi there,
>> I have following setup:
>> router with USB - TP-LINK MR-3220,
>> USB 2.0 hub,
>> CSR BT USB dongle plugged to hub,
>> "USB audio card" plugged to the same hub.
>>
>> I use (successfully) this "card" to play internet radio (wget | madplay).
>>
>> Now I want to enable this router to act as HF (stereo, A2DP?) device over
>> Bluetooth.
>> What modules (programs) I need,
>> and most important:how to configure it?
>>
>> Current software is OpenWRT trunk 33310, compiled at home.
>> [I am not "purist", I don't need WWW interface..., so I may switch to
>> pure buildroot, if I find the "solution"]
>>
>> [same question on OpenWRT forum is still w/o response... :( ]
>
>   I guess you may have more success on a bluetooth mailing list...
> Perhaps start with looking at the bleuz_utils documentation.

I am not a (Linux) programmer :(, I'll try the list.

A little bit of progress:
I have managed to compile "2years old" "nohands" software, tweaking 
"libhfp" Makefile with CPPFLAGS = -f permissive and
"tests" Makefile with LDFLAGS = -lpthreads

After doing (suggested by software) hciconfig hci0 scomtu 64:8 (as root),
application (and daemon) hfconsole started, I could search my phone (SE 
X8, Android one), and connect.
Even place / answer calls, but ONLY on headset audio.

When I tried to switch to "speaker" I got total system FREEZE. (repeatable).

I am now guessing if it is related to BT or Alsa audio... (no Pulse 
support in this soft, Alsa and OSS only).

And audio (at least output) looks working good on this machine - I can 
play music /movies.

Would a test with external USB "sound card" give some relevant information?

W.P.

[BTW, Arnout: I am trying to do something in Your "domain" - embedded :) ].
>
>   Regards,
>   Arnout
>
>>
>> [BTW, anyone interested in serial(USB maybe) IR transceiver? based on
>> ATMega328P, LIRC compatible] - working with ANY serial (including
>> USB->serial dongles)
>>
>> W.P.
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
>
