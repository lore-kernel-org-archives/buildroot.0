From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Jun 2012 00:36:59 +0200
Subject: [Buildroot] Passing compile flags to every component
In-Reply-To: <4FD8FFB1.2010702@cats-muvva.net>
References: <4FD8FFB1.2010702@cats-muvva.net>
Message-ID: <4FD9160B.9010306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/13/12 23:01, Nicole wrote:
> Sorry if this is a newbie question. Can anyone give me some directions about how to to pass a set of {C{,XX,PP},LD}FLAGS
> to the build of each and every application that will be put on the disk image?
>
[snip]
> BR2_TARGET_OPTIMIZATION="-pipe"
> BR2_TARGET_LDFLAGS=""

  Those are the buildroot config options you want to modify.

  It's not 100% guaranteed to work for all packages (some packages do explicit
massaging of the CFLAGS passed to them; the Linux kernel is one of them).

  For the -mtune=geode flag, specifically, that should be selected automatically
if you choose geode as the sub-architecture.

  PS: Please avoid posting a full config - do a 'make savedefconfig' and post the
resulting defconfig file.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
