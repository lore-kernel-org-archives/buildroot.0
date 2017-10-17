From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 11:03:21 +0200
Subject: [Buildroot] [PATCH v4] HOST_DIR/lib: symlink respectively to
	lib32/64
In-Reply-To: <1507152799-16949-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Wed, 4 Oct 2017 16:33:19 -0500")
References: <1507152799-16949-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <874lqykuxy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Discovered the issue on a RHEL7.4 machine where
 > the cmake build dynamically selected HOST_DIR/lib64
 > as the installation path for the lzo2 library.

 > Fixes failures like the following:
 > host-mtd
 > http://autobuild.buildroot.net/results/d31/d31581d2e60f35cf70312683df99c768e2ea8516/

 > host-squashfs
 > http://autobuild.buildroot.net/results/d9c/d9c95231ac774ed71580754a15ebb3b121764310/

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---

 > Changes:
 > [Arnout
 > v3 -> v4
 >  - Added @ infront of case statement
 >  - Handled case of HOST_DIR ends up being newer and ln -s
 >    would create a link inside of the lib folder.  Add -nf
 >    to the args of ln (ie. ln -snf)

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
