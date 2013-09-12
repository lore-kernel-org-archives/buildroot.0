From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Sep 2013 21:29:07 +0200
Subject: [Buildroot] [PATCH v2 02/17] libselinux: new package
In-Reply-To: <1378936777-28308-3-git-send-email-clshotwe@rockwellcollins.com>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378936777-28308-3-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20130912212907.57bdf08c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 11 Sep 2013 16:59:22 -0500, Clayton Shotwell wrote:
> 
> Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>

After testing this package, it turns out that:

 *) By default it needs large file support, because src/Makefile forces
 -D_FILE_OFFSET_BITS=64. If you remove this from the Makefile, then it
 builds fine with a toolchain that does not have large file support. So
 your options are: remove this flag from the Makefile, or make the
 package (and all its reverse dependencies depend on large file
 support).

 *) It needs thread support. So you should add a 'depends on
 BR2_TOOLCHAIN_HAS_THREADS', a comment when no thread support is
 available, and propagate this to all the reverse dependencies of
 libselinux.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
