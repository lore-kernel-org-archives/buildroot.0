From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 1 Nov 2012 02:14:35 +0100
Subject: [Buildroot] [PATCH 1/1] Create a symbolic link to the target
	kernel directory.
In-Reply-To: <5091CB65.8070409@mind.be>
References: <1351729065-31324-1-git-send-email-sagaert.johan@skynet.be>
 <5091CB65.8070409@mind.be>
Message-ID: <75B2C156488F433AB22D082571AE6D4E@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi Arnout

I always build modules outside of the buildroot system.
Is there another (fast ) way ? I don't like to wait 20 seconds for buildroot tarring the rootfs. 

Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Arnout Vandecappelle
Verzonden: donderdag 1 november 2012 2:08
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH 1/1] Create a symbolic link to the target kernel directory.

On 11/01/12 01:17, Sagaert Johan wrote:
> This symbolic link makes it easier when building kernel modules.
> The makefile for a module no longer has to point to the full directory name of the kernel but can use this symbolic link instead.
> You no longer need to edit the path to the kernel tree in the module's makefiles when changing your target kernel version.

  I don't see the point...  What's wrong with passing KERNELDIR=$(LINUX_DIR) to the sub-make in the .mk file?  Cfr. lttng-modules.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
