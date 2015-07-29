From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 22:47:26 +0200
Subject: [Buildroot] [PATCH 1/1] packages/btrfs-progs: fix build issues
 under musl
In-Reply-To: <1438195815-29424-1-git-send-email-brendanheading@gmail.com>
References: <1438195815-29424-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150729224726.71925205@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Wed, 29 Jul 2015 19:50:15 +0100, Brendan Heading wrote:

> +diff --git a/kerncompat.h b/kerncompat.h
> +index 5d92856..7c627ba 100644
> +--- a/kerncompat.h
> ++++ b/kerncompat.h
> +@@ -33,7 +33,9 @@
> + #include <features.h>
> + 
> + #ifndef __GLIBC__
> ++#ifndef BTRFS_DISABLE_BACKTRACE
> + #define BTRFS_DISABLE_BACKTRACE
> ++#endif

While this is a quick hack that works, I think it's really nothing more
than a hack. I've implemented what I believe is a better solution, can
you look at:

	https://github.com/tpetazzoni/btrfs-progs/commits/configure-improvements

(last two commits)

Basically, this proposal uses configure.ac properly to detect backtrace
support.

Can you check if that continues to work fine with glibc and musl, and
if so, submit the patches upstream?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
