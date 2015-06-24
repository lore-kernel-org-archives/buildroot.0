From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Jun 2015 23:18:05 +0200
Subject: [Buildroot] Problem with Touchscreen on ARM
In-Reply-To: <CALW-xeqpfVVYeff9+RPfhOhEEW3mohbqXEweXP7YQJuoYX1Erg@mail.gmail.com>
References: <CALW-xeqpfVVYeff9+RPfhOhEEW3mohbqXEweXP7YQJuoYX1Erg@mail.gmail.com>
Message-ID: <558B1E8D.9010106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/24/15 16:23, Guillaume s?tan wrote:
> Hello,
> 
> I try to use a Touchscreen (multitouch) with my target (Arm Little endian -
> Cortex - A9 ).
> I tried to use EFL, directfb and fb but I haven't managed to run the multitouch
> on my target.

 fb is just a framebuffer driver so doesn't have a relation with input events.

 directfb doesn't yet support multitouch AFAIK.

 EFL should support multitouch. But I guess you have to configure it to listen
to the right input device.

> 
> Please can you explain me what packages are needed to use multitouch ?
> Or have you ever used a touch screen on a target Arm ?

 You could try tslib (which converts multitouch to single touch so probably not
really what you want). Qt5 also has support for multitouch.

> 
> Regards,
> 
> Guillaumme 
> 
> 
> PS : I see frames on my target (arm ) when I touch my screen with application mtdev.

 What do you mean with 'frames'?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
