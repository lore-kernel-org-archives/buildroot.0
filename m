From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2015 16:17:55 +0200
Subject: [Buildroot] [PATCH] libmemcached: don't use -fPIE and -pie with
	FLAT binaries
In-Reply-To: <1431377736-2574-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 May 2015 22:55:36 +0200")
References: <1431377736-2574-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mw19hobw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > FLAT binaries cannot use -fPIE and -pie code, so let's teach
 > libmemcached to not use such flags when BR2_BINFMT_FLAT=y.

 > Fixes:

 >   http://autobuild.buildroot.org/results/8cb/8cbf57f9136cb42be31c88e0f1f32d3d2353e5ff/
 >   and many previous similar build failures

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed after reworking (and rewording) to trigger based on
BR2_STATIC_LIBS instead, thanks.

-- 
Bye, Peter Korsgaard
