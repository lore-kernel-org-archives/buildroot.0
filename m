From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 09 Apr 2013 18:43:57 +0200
Subject: [Buildroot] Newbie questions on building images for EP405
In-Reply-To: <CAADET=cXud-Oyp5Fk5Ybox-_TcdVKpyharCh00am6+bJaXgUXQ@mail.gmail.com>
References: <CAADET=fm0cNPKvvRj6k9nOiGqXZqVGLM7fabj=y8X8sR197WUw@mail.gmail.com>
 <5162F0E2.2030103@zacarias.com.ar>
 <CAADET=cXud-Oyp5Fk5Ybox-_TcdVKpyharCh00am6+bJaXgUXQ@mail.gmail.com>
Message-ID: <5164454D.2040602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/13 17:13, David Li wrote:
> => bootm 0x100000
> ## Booting image at 00100000 ...
>     Image Name:   Linux-3.7.8
>     Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>     Data Size:    2571933 Bytes =  2.5 MB
>     Load Address: 00000000
>     Entry Point:  00000000
>     Verifying Checksum ... OK
>     Uncompressing Kernel Image ... Error: inflate() returned -3
> GUNZIP ERROR - must RESET board to recover

  The uImage is stored at address 0x100000 (=1M) and then extracted at 
0x00000000, and it's 2.5MB compressed... so you can imagine that the 
extracted image may overwrite the compressed image.

  Can you try tftpbooting at a higher address?


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
