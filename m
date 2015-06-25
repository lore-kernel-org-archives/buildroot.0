From: =?UTF-8?Q?Guillaume_s=C3=A9tan?= <setan.buildroot@gmail.com>
Date: Thu, 25 Jun 2015 10:04:43 +0200
Subject: [Buildroot] Problem with Touchscreen on ARM
In-Reply-To: <558B1E8D.9010106@mind.be>
References: <CALW-xeqpfVVYeff9+RPfhOhEEW3mohbqXEweXP7YQJuoYX1Erg@mail.gmail.com>
 <558B1E8D.9010106@mind.be>
Message-ID: <CALW-xeo1AEKxyX2u98w5qe7adphyj+MZ7Z4gezWYv1wtvjk4sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-06-24 23:18 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:

On 06/24/15 16:23, Guillaume s?tan wrote:

>> Hello,

>>

> >I try to use a Touchscreen (multitouch) with my target (Arm Little
endian -

>> Cortex - A9 ).

> >I tried to use EFL, directfb and fb but I haven't managed to run the
multitouch

>> on my target.


 >fb is just a framebuffer driver so doesn't have a relation with input
events.

>
 >directfb doesn't yet support multitouch AFAIK.

>
 >EFL should support multitouch. But I guess you have to configure it to
listen
>to the right input device.

    How I can do that ?


>
>>

>> Please can you explain me what packages are needed to use multitouch ?

>> Or have you ever used a touch screen on a target Arm ?


> You could try tslib (which converts multitouch to single touch so
probably not

>really what you want). Qt5 also has support for multitouch.

>
>>

>> Regards,

>>

>> Guillaumme

>>

>>

>> PS : I see frames on my target (arm ) when I touch my screen with
application mtdev.


 >What do you mean with 'frames'?


When I try the application mtdev, I see that :

 # ./mtdev-test /dev/input/event1
 supported mt events:
ABS_MT_SLOT
ABS_MT_POSITION_X
ABS_MT_POSITION_Y
ABS_MT_TRACKING_ID
014e29b54bd1 00 3 0039 0

014e29b54bd1 00 3 0035 22640
014e29b54bd1 00 3 0036 9019
014e29b54bd1 00 1 014a 1
014e29b54bd1 00 3 0000 22640
014e29b54bd1 00 3 0001 9019
014e29b54bd1 00 0 0000 0
014e29b54c5a 00 3 0035 22641
014e29b54c5a 00 3 0000 22641
014e29b54c5a 00 0 0000 0
014e29b54c60 00 3 0035 22642
014e29b54c60 00 3 0036 9020
014e29b54c60 00 3 0000 22642
014e29b54c60 00 3 0001 9020
014e29b54c60 00 0 0000 0
014e29b54c7f 00 3 0039 -1
014e29b54c7f 00 1 014a 0
014e29b54c7f 00 0 0000 0


Regards,


Guillaume
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150625/7bcf8153/attachment.html>
