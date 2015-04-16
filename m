From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Apr 2015 21:55:20 +0200
Subject: [Buildroot]
 =?utf-8?q?Analysis_of_build_error=3A_ffmpeg-2=2E6=2E2?=
 =?utf-8?q?=40bfin_on_Nathaniel=C2=B4s_autobuilder?=
In-Reply-To: <XnsA47DDCE7A4440berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <XnsA47DDCE7A4440berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <553013A8.1050701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/04/15 21:42, Bernd Kuhls wrote:
> today this build error happened:
> http://autobuild.buildroot.net/results/d13/d13488a43f6e034623104a36c07114db99
> 325b8d/
> 
> I can not reproduce the error here but I think I know why it happened:
> 
> $ grep -i ^ranlib output/build/ffmpeg-2.6.2/config.log
> RANLIB='/home/fli4l/br3/output/host/usr/bin/bfin-uclinux-ranlib'
> ranlib_default='ranlib'

 The problem is that bfin-uclinux-ranlib does not have the -D option. I think we
have to pass --ranlib=$(TARGET_RANLIB) to configure.

 I could reproduce and that fixes it. Patch follows.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
