From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Nov 2012 03:26:08 +0100
Subject: [Buildroot] [PATCH v3] fs/common: Create initial console device
In-Reply-To: <1352108694-11875-1-git-send-email-markos.chandras@gmail.com>
References: <1352108694-11875-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <509DBB40.1050100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/12 10:44, Markos Chandras wrote:
> From: Markos Chandras<markos.chandras@imgtec.com>
>
> A /dev/console node must be present in rootfs when the Linux kernel
> boots otherwise the kernel will print the following warning:
> "Warning: unable to open an initial console"
>
> This is because when we use an initramfs the /dev directory is not
> populated at this point. This can cause problems when a program
> (e.g ldso with early debugging enabled) opens a standard file
> descriptor for read/write before these descriptors are actually
> created by the init process later on.
>
> Signed-off-by: Markos Chandras<markos.chandras@imgtec.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
