From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 20:09:06 +0200
Subject: [Buildroot] [PATCH v3 1/3] gdb: get rid of host-texinfo
	dependency
In-Reply-To: <1476187354-13966-1-git-send-email-patrickdepinguin@gmail.com>
 (Thomas De Schampheleire's message of "Tue, 11 Oct 2016 14:02:32
 +0200")
References: <1476187354-13966-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <87k2dazttp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > The host-texinfo dependency in gdb/host-gdb was added because gdb insisted
 > in building info documentation in recent versions, and we want to avoid
 > 'makeinfo' to be present on the build system.

 > However, there is another solution that does not require actually building
 > host-texinfo: instruct the makefiles to use a dummy makeinfo command
 > ('true').

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > ---
 >  package/gdb/gdb.mk | 11 +++++------
 >  1 file changed, 5 insertions(+), 6 deletions(-)

 > v2: use INSTALL_TARGET_OPTS for target packages iso INSTALL_OPTS
 > (INSTALL_STAGING_OPTS not needed: INSTALL_STAGING != YES)
 > v3: fix INSTALL_TARGET_OPTS to include the actual 'install' make target

As Thomas already applied your earlier version, I've instead added a
patch to add back the 'install'.

-- 
Bye, Peter Korsgaard
