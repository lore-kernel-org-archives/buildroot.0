From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Apr 2015 10:19:45 +0200
Subject: [Buildroot] [git commit] python3: needs dynamic library support
In-Reply-To: <20150428100057.2eefa119@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 28 Apr 2015 10:00:57 +0200")
References: <20150428065522.6D9387FFFD@busybox.osuosl.org>
 <20150428100057.2eefa119@free-electrons.com>
Message-ID: <87bni8zmu6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Tue, 28 Apr 2015 08:50:04 +0200, Peter Korsgaard wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=54915af7c75851318385affd037c7718e10f2665
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/c65/c65c2b2c4c2ca328c4f26ba38798c40ab02c8772/
 >> http://autobuild.buildroot.net/results/e0d/e0db38ca12dbe664d472c4f6f3f1ade4150119c3/
 >> http://autobuild.buildroot.net/results/8e1/8e196d05dd65cdd782c8d41d937a7d9d2ef7dc1a/
 >> http://autobuild.buildroot.net/results/e3a/e3a71f5d05a3e176a9e641e758b1ba64c9560991/
 >> 
 >> And many more.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > I disagree. This is not the right fix. Python 3 can build perfectly
 > fine in a static environment. What you're seeing here are uClibc bugs,
 > not an impossibility of building Python 3 statically.

Well, then we should atleast fix this:

#
# Make sure libpython gets stripped out on target
#
define PYTHON3_ENSURE_LIBPYTHON_STRIPPED
	chmod u+w $(TARGET_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR)*.so
endef

PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_ENSURE_LIBPYTHON_STRIPPED

Are there really use cases for building python3 statically?

-- 
Venlig hilsen,
Peter Korsgaard 
