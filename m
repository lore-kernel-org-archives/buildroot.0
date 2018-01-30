From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 23:50:05 +0100
Subject: [Buildroot] [PATCH] lz4: install programs as well as libraries
In-Reply-To: <20180110224052.6830-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 10 Jan 2018 23:40:52 +0100")
References: <20180110224052.6830-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87fu6n9d2a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Prior to commit 8ad38a4fc2007df4bee9a941aed46c8771b6a84c
 > ("package/lz4: bump version to r131"), the lz4 package was installing
 > both libraries and programs, but this commit changed the behavior to
 > only install libraries.

 > The contributor might have been confused by the fact that the build
 > command was "$(MAKE) ... -C $(@D) liblz4", suggesting that only the
 > library was built. But since the install command was "$(MAKE) ... -C
 > $(@D) install", the programs were effectively built as part of the
 > install step, and installed as well.

 > Since it makes sense for lz4 to also installs its programs, this
 > commit adjusts the package accordingly.

 > It is worth mentioning that using the "all" target during the build
 > step is important. Indeed, otherwise the programs/Makefile has a
 > "default" target that doesn't build everything (especially the lz4c
 > program) and it end up being built as part of the install step, due to
 > how the makefile dependencies are handled in the lz4 project. To make
 > sure that everything gets built during the build step, we explicitly
 > use the "all" target.

 > Fixes bug #9996

 > Reported-by: Jamin Collins <jamin.collins@gmail.com>
 > Initial-analysis-by: Arnout Vandecappelle <arnout@mind.be>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
