From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 01 Nov 2012 02:07:49 +0100
Subject: [Buildroot] [PATCH 1/1] Create a symbolic link to the target
 kernel directory.
In-Reply-To: <1351729065-31324-1-git-send-email-sagaert.johan@skynet.be>
References: <1351729065-31324-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <5091CB65.8070409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/01/12 01:17, Sagaert Johan wrote:
> This symbolic link makes it easier when building kernel modules.
> The makefile for a module no longer has to point to the full directory name of the kernel but can use this symbolic link instead.
> You no longer need to edit the path to the kernel tree in the module's makefiles when changing your target kernel version.

  I don't see the point...  What's wrong with passing KERNELDIR=$(LINUX_DIR) to
the sub-make in the .mk file?  Cfr. lttng-modules.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
