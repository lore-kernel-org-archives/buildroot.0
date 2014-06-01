From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2014 22:17:47 +0200
Subject: [Buildroot] [PATCH v4 03/11] pkg-cmake.mk: enable ccache for
	cmake packages
In-Reply-To: <1401614673-3703-4-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 1 Jun 2014 11:24:25 +0200")
References: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
 <1401614673-3703-4-git-send-email-s.martin49@gmail.com>
Message-ID: <87vbsk2xlg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > This patch updates the generated toolchainfile.cmake to use ccache.
 > When toolchainfile.cmake is used inside Buildroot, using ccache during
 > the build is driven by a CMake knob: USE_CCACHE, automatically set by
 > the cmake-package infrastructure and reflecting the BR2_CCACHE value.

 > Since this toolchainefile.cmake file can be used outside Buildroot, and
 > this file also set a couple of things (among these: the sysroot cflag,
 > some pkg-config environment variables), it is important to set the
 > compiler variables as well to keep the consistency of the
 > cross-compilation configuration.
 > So, when it is used outside Buildroot, using ccache for the build is
 > driven by the ccache program availability.

 > Note that using ccache for the build is achieved by setting the *_ARG1
 > CMake variables to let CMake use ccache without failing in detecting
 > the compiler.

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > Cc: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
