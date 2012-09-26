From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Sep 2012 09:25:23 +0200
Subject: [Buildroot] [PATCH v3 RESEND] pkg-infra: make sure cross
 compiling is enabled when host == target
In-Reply-To: <1348612962-11310-1-git-send-email-arnout@mind.be>
References: <1348612962-11310-1-git-send-email-arnout@mind.be>
Message-ID: <20120926092523.6a26c22f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Wed, 26 Sep 2012 00:42:42 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> When compiling for the same architecture and libc as the host,
> GNU_TARGET_NAME and GNU_HOST_NAME are equal.  configure scripts use
> these to detect cross-compilation, and will decide that we're doing
> native compilation.  This may trigger running of executables,
> which fail because of missing libraries in the host environment.
> 
> To solve this, set the vendor part in GNU_TARGET_NAME to buildroot.
> 
> This problem exists for instance in xserver_xorg-server on x86_64.

I confirm the problem, and I think this is the right solution, but I
haven't had the time to test it. But anyway:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
