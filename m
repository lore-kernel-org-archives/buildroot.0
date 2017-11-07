From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Nov 2017 11:40:37 +0100
Subject: [Buildroot] [PATCH v2] vboot-utils: fix ARCH detection
In-Reply-To: <20171107101715.GA26991@latitude.localdomain>
References: <20171107101715.GA26991@latitude.localdomain>
Message-ID: <20171107114037.3ac35009@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Nov 2017 12:17:15 +0200, Alex Suykov wrote:
> The package includes some target-specific code that is irrelevant
> in a host package but gets built anyway. The target for this code
> must be one of the supported ChromeOS targets.
> 
> Supplied Makefile apparently relies on the environment to provide
> a valid target, with a simple fallback to host arch. This breaks
> the build if no value is provided and the host arch is not among
> the supported ones.
> 
> Should fix
> http://autobuild.buildroot.net/results/d118a83b6c4f7f910d0d44c279f36251d7ba29e8/
> and similar failures.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

Thanks for this new version. However, you still didn't reply to me
about what happens when HOST_ARCH != ARCH. The vboot-utils Makefile
seems to have some logic to use Qemu in that case. Do you understand
what it does exactly with Qemu, and that we won't have a problem by
having HOST_ARCH != ARCH ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
