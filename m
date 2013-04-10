From: David Li <w.david.li@gmail.com>
Date: Tue, 9 Apr 2013 20:16:16 -0700
Subject: [Buildroot] Newbie questions on building images for EP405
In-Reply-To: <5164454D.2040602@mind.be>
References: <CAADET=fm0cNPKvvRj6k9nOiGqXZqVGLM7fabj=y8X8sR197WUw@mail.gmail.com>
 <5162F0E2.2030103@zacarias.com.ar>
 <CAADET=cXud-Oyp5Fk5Ybox-_TcdVKpyharCh00am6+bJaXgUXQ@mail.gmail.com>
 <5164454D.2040602@mind.be>
Message-ID: <CAADET=cRnm-WpZJJiweS48MQB3HmzCYjqw9qER98OpUHpVWkrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, thanks for pointing that out. I moved it to 0xFC0000 (about 16MB).
This time it seems uncompressed ok but it hung forever after that. Any
suggestions how to debug this? How do I turn on the kernel debug messages
from the config menu?


=> bootm 0xfc0000
## Booting image at 00fc0000 ...
   Image Name:   Linux-3.7.8
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    2571933 Bytes =  2.5 MB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK




On Tue, Apr 9, 2013 at 9:43 AM, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 09/04/13 17:13, David Li wrote:
>
>> => bootm 0x100000
>> ## Booting image at 00100000 ...
>>     Image Name:   Linux-3.7.8
>>     Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>>     Data Size:    2571933 Bytes =  2.5 MB
>>     Load Address: 00000000
>>     Entry Point:  00000000
>>     Verifying Checksum ... OK
>>     Uncompressing Kernel Image ... Error: inflate() returned -3
>> GUNZIP ERROR - must RESET board to recover
>>
>
>  The uImage is stored at address 0x100000 (=1M) and then extracted at
> 0x00000000, and it's 2.5MB compressed... so you can imagine that the
> extracted image may overwrite the compressed image.
>
>  Can you try tftpbooting at a higher address?
>
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130409/e2e45447/attachment.html>
