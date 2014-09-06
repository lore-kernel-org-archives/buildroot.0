From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 06 Sep 2014 22:18:42 +0200
Subject: [Buildroot] [PATCH] nodejs: fix build of host-nodejs
In-Reply-To: <1410022854-25123-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 6 Sep 2014 19:00:54 +0200")
References: <1410022854-25123-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87tx4kmrj1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In commit 89fae0d05daa8645ae3078746065ebed5c3c049f ("nodejs: Add
 > dependency on zlib"), Paul added a dependency of host-nodejs on
 > host-zlib. When host-zlib is built, the host variant of zlib is
 > installed in $(HOST_DIR)/usr/lib. However, even though
 > -L$(HOST_DIR)/usr/lib is passed to the LDFLAGS of host-nodejs
 > configure script, those LDFLAGS are not re-used at build and install
 > time. This is because nodejs does not use the autotools and its
 > configure script does not "save" the environment variables such as
 > LDFLAGS. This is causing build failures such as:

 >   http://autobuild.buildroot.org/results/802/802134ceb92d82d2d4ef6a81c67ad1c98696663a/

 > due to the fact that the host zlib cannot be found.

 > This commit fixes that by passing $(HOST_CONFIGURE_OPTS) explicitly at
 > both build time and install time of host-nodejs. This approach was
 > already used for the target variant of nodejs.

 > Cc: Paul Cercueil <paul@crapouillou.net>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
