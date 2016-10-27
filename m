From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Oct 2016 10:38:48 +0200
Subject: [Buildroot] [git commit] core/pkg-generic: check proper package
	installation
In-Reply-To: <20161026203713.9732A7FD9B@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 26 Oct 2016 22:36:44 +0200")
References: <20161026203713.9732A7FD9B@busybox.osuosl.org>
Message-ID: <878ttajief.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=938f47c7e89362e7b824dbd0bd1ee9839d56d603
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Some packages misbehave, and install files in either $(STAGING_DIR)/$(O)
 > or in $(TARGET_DIR)/$(O) .

 > One common reason for that is that pkgconf now prepends the sysroot path
 > to all the paths it returns. Other reasons vary, but are mostly due to
 > poorly writen generic-packages.

 > And a new step hooks to check that no file gets installed in either
 > location, called after the install-target and install-staging steps.

Didn't we just discuss that this duplicates the proposed
leak-of-host-paths stuff Samuel is working on?

-- 
Bye, Peter Korsgaard
