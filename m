From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 22:55:22 +0200
Subject: [Buildroot] [PATCH] pkg-infra: make sure cross compiling is
 enabled when host == target
In-Reply-To: <1341957681-22303-1-git-send-email-arnout@mind.be>
References: <1341957681-22303-1-git-send-email-arnout@mind.be>
Message-ID: <20120713225522.62040e4f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 11 Jul 2012 00:01:20 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> When compiling for the same architecture and libc as the host,
> GNU_TARGET_NAME and GNU_HOST_NAME are equal.  configure scripts use
> these to detect cross-compilation, and will decide that we're doing
> native compilation.  This may trigger running of executables,
> which fail because of missing libraries in the host environment.
> 
> To solve this, set the vendor part in GNU_HOST_NAME to buildroot_cross.

Do you see a problem with setting it just to "buildroot"?
buildroot_cross looks a bit ugly to me.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
