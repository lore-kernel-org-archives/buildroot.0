From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Dec 2012 17:49:09 +0100
Subject: [Buildroot] [git commit] pkg-infra: introduce errors for legacy
 API
In-Reply-To: <20121130201152.E2AE89940D@busybox.osuosl.org>
References: <20121130201152.E2AE89940D@busybox.osuosl.org>
Message-ID: <20121201174909.1d52aad3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 30 Nov 2012 12:06:40 -0800, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=ebcfa987df4095a7805ff124ab648fb607c89215
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> As discussed in the BR developer days, we want to be more strict about API
> changes in buildroot. I.e., we want to make it less likely that a user's
> customizations break down after upgrading buildroot.
> 
> A first step is to make sure that the user is warned about API changes.
> This patch introduces Makefile.legacy and Config.in.legacy, which will
> issue clear error messages for such situations.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

This doesn't really work well with randpackageconfig, and therefore
breaks the autobuilders badly.

For example, randpackageconfig can enable BR2_PACKAGE_GETTEXT_STATIC,
because it matches BR2_PACKAGE_<foo>, this will select BR2_LEGACY,
which will abort the build.

Should it be fixed just in the autobuilders scripts, or do we consider
the fact that "make randpackageconfig" generates un-buildable
configuration is a bug by itself?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
