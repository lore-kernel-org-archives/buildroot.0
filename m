From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Oct 2020 08:09:55 +0200
Subject: [Buildroot] [PATCHv2 master+LTS]
 support/scripts/setlocalversion: fix/improve Mercurial output
In-Reply-To: <20200930081823.7221-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 30 Sep 2020 10:18:23 +0200")
References: <20200930081823.7221-1-patrickdepinguin@gmail.com>
Message-ID: <87lfglp5jg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Commit 9e4ffdc8cfdf4c73f4fa8c66259a5aadaee4ae88 modified the output of
 > 'setlocalversion' so that the Buildroot version tag is included in the
 > output, the version part was added in Makefile.

 > Due to differences in behavior of the used git and Mercurial commands, this
 > caused different output for the Mercurial case, in BR2_VERSION_FULL and thus
 > /etc/os-release and 'make print-version'. Assuming the official Buildroot
 > releases are tagged and no project-specific tags are present, the output
 > after commit 9e4ffdc8cfdf4c73f4fa8c66259a5aadaee4ae88 is:
 >     -hg<commit>
 > whereas it is expected to be something like:
 >     2020.02.6-hg<commit>

 > Change the Mercurial case in setlocalversion to behave similar to git,
 > looking up the latest tag if the current revision is not itself tagged.

 > The number of commits after the latest tag is not added, unlike in git, as
 > this value is not commonly present in Mercurial output, and its added value
 > can be disputed in this context. Even one commit could bring a huge change
 > to the sources, so in order to interpret the number one has to look at the
 > repository anyhow, in which case the commit ID can just be used.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

 > ---
 > v2: use intermediate var 'latesttag' rather than separate printf (Yann)

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
