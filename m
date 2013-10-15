From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Oct 2013 16:22:39 +0200
Subject: [Buildroot] [git commit] omniorb: cleanup autobuild failure,
 CFLAGS issue
In-Reply-To: <20131002222257.646829B8DF@busybox.osuosl.org>
References: <20131002222257.646829B8DF@busybox.osuosl.org>
Message-ID: <20131015162239.2e45fb44@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 2 Oct 2013 23:54:41 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=dd7981bfd22b1c0af8a0fd3c12673294f66eadb5
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Fixed:
> http://autobuild.buildroot.net/results/a08baf8821e3ee1fb9c36c8f74c4ced466af167b/
> http://autobuild.buildroot.net/results/f0c7379c1f405385d3a64c0349c3d9565065e8a7/
> http://autobuild.buildroot.net/results/c3de25ca52fdb8ffda7472cf9f7b64514954cbb1/
> 
> Change Log:
> The target CFLAGS were getting mixed in during a manual build of some
> omniorb pkg tools that could be viewed as host tools.
> This manual build was a dirty workaround and created some bad
> cornercases. So I converted the package over to actually using the
> host pkg build and removed the need for a patch and custom mods in the build.
> 
> Also there wasn't a dependency on the target having python, just
> host-python for performing the initial build.  So depends were adjusted
> accordingly. If python bindings are required, they can be found in a different
> package called omniORBpy.  The omniORB package only uses python for
> the build process.
> 
> Fixed a bug with long double support.  Currently leaving it disabled
> as most targets won't use it.  This allows greater toolchain compatibility.
> 
> Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

It seems the problem isn't entirely fixed, see
http://autobuild.buildroot.org/results/915/915e5ad9f888f3a26741315b7a5f1358726cf1c1/build-end.log.
The native g++ gets called with target compiler flags (specific to
PowerPC).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
