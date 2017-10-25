From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Oct 2017 09:42:00 +0200
Subject: [Buildroot] [git commit] dependencies: always use
	HOSTCC_NOCACHE for DEPENDENCIES_HOST_PREREQ
In-Reply-To: <20171022133510.B58B5810E1@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sun, 22 Oct 2017 15:42:26 +0200")
References: <20171022133510.B58B5810E1@busybox.osuosl.org>
Message-ID: <87wp3j4qt3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=36d398ac30f35ca9d4405a9dee2b33560ec3595d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Currently, HOSTCC and HOSTCXX are set to their _NOCACHE variants in the
 > 'dependencies' target. This is needed because at that time, ccache is
 > not built yet - host-ccache is one of the dependencies. However, because
 > this override is only specified for the 'dependencies' target (and
 > thereby gets inherited by its dependencies), the override is only
 > applied when the package is reached through the 'dependencies' target.
 > This is not the case when one of DEPENDENCIES_HOST_PREREQ is built
 > directly from the command line, e.g. when doing 'make host-ccache'. So
 > in that case, ccache will be built with ccache... which fails of
 > course.

 > To fix this, directly apply the override to the DEPENCIES_HOST_PREREQ
 > targets.

 > Note that this only fixes the issue for 'make host-ccache', NOT for
 > e.g. 'make host-ccache-configure'.

 > Signed-off-by: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
 > [Arnout: improve commit message]
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
