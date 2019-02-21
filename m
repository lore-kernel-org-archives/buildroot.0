From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 13:53:39 +0100
Subject: [Buildroot] [PATCH] package/docker-containerd: fix typo in
 uclibc dependency
In-Reply-To: <20190214085310.25955-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 14 Feb 2019 09:53:10 +0100")
References: <20190214085310.25955-1-thomas.petazzoni@bootlin.com>
Message-ID: <87h8cxs3os.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Commit 6e3f7fbc072c88ab344f2ffa39e402464b566f19 ("package/runc: add
 > upstream security fix for CVE-2019-5736") added a dependency of
 > docker-containerd to uclibc (inherited from runc), but the depends on
 > has a typo that makes it ineffective. Due to this, docker-containerd
 > can still be selected in uClibc configurations, causing runc to be
 > build, and failing to build due fexecve() being missing in uClibc.

 > Fixes:

 >   http://autobuild.buildroot.net/results/64ecdb1e007106fdb05979b10b42b90591255504/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
