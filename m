From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 21:22:11 +0100
Subject: [Buildroot] [PATCH v2] bluez-utils: disable on avr32
In-Reply-To: <1352797007-9509-1-git-send-email-spdawson@gmail.com>
References: <1352797007-9509-1-git-send-email-spdawson@gmail.com>
Message-ID: <50A2ABF3.9050206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/12 09:56, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> The bluez-utils package does not build for the avr32 architecture; this
> results in autobuilder failures such as the following.
>
>    http://autobuild.buildroot.net/results/d737d1220d7566289eee802fd580a49d8c456c97/build-end.log
>
> The underlying problem is with the<sys/epoll.h>  header provided by the
> antiquated avr32 toolchain; this header lacks definitions for
> epoll_create1() and EPOLL_CLOEXEC.
>
> This patch disables support for the bluez-utils package on the avr32
> architecture.
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

This one is for 2012.11.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
