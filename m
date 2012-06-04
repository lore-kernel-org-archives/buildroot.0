From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 05 Jun 2012 01:16:39 +0200
Subject: [Buildroot] [PATCH resend] owl-linux: new package
In-Reply-To: <1337980041-25675-1-git-send-email-spdawson@gmail.com>
References: <1337980041-25675-1-git-send-email-spdawson@gmail.com>
Message-ID: <4FCD41D7.7010203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/25/12 23:07, spdawson at gmail.com wrote:
> +Kernel commit b81693d9149c598302e8eb9c20cb20330d922c8e changed the
> +net_device_ops structure, removing the ndo_set_multicast_list callback. The
> +ndo_set_rx_mode has also been added to this structure.
> +
> +The upshot of these changes is that owl-linux fails to compile with 3.3.x
> +kernels.

  Won't this patch break the build on pre-3.3 kernels?  I think there should
be an #if LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0) around it.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout@mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
