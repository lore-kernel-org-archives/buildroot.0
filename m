From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Feb 2014 20:58:23 +0100
Subject: [Buildroot] Significant problem with the parallel build patch
	series
In-Reply-To: <20140228205451.76e9996f@skate>
References: <1393605956-18133-1-git-send-email-yann.morin.1998@free.fr>
 <20140228201620.1f4b13ba@skate> <20140228205451.76e9996f@skate>
Message-ID: <20140228205823.1d5c76eb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Feb 2014 20:54:51 +0100, Thomas Petazzoni wrote:

> Fabio, which solution would you propose to ensure that packages get
> built even if no filesystem image format has been selected?

What about:

-target-post-image: $(TARGETS_ROOTFS)
+target-post-image: $(TARGETS_ROOTFS) target-finalize

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
