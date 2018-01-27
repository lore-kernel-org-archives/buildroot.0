From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 13:15:41 +0100
Subject: [Buildroot] [PATCH V2] nilfs-utils: fix build with static
 toolchains
In-Reply-To: <1516652830-18339-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 (Kurt Van Dijck's message of "Mon, 22 Jan 2018 21:27:10 +0100")
References: <1516652830-18339-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
Message-ID: <878tcjh502.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kurt" == Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> writes:

 > This commit adds a patch to respect the dependency libmount->libblkid->libuuid
 > properly in autoconf. This becomes necessary for static builds.

 > Fixes:
 >  http://autobuild.buildroot.net/results/acaac513eaaa39d4000268428407a9fa6989ef03
 >  http://autobuild.buildroot.net/results/41af95b9ed7bbbe319565e1c20d1f6e2665d445f

 > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 > ---

 > Changes since V1:
 > * use PKG_CHECK_MODULES instead of hand-coding the required libraries.

You then also need to add host-pkgconf to NILFS_UTILS_DEPENDENCIES.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
