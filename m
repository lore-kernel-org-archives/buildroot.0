From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 May 2013 22:22:47 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/gcc: make sure to pass
	$(HOST_DIR)/usr/bin in the PATH
In-Reply-To: <1368114785-14666-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 9 May 2013 17:53:04 +0200")
References: <1368114785-14666-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871u9cvtgo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Mischa Jonker <Mischa.Jonker@synopsys.com>
 Thomas> Since gcc doesn't use the package infrastructure, it doesn't get all
 Thomas> the good generic environment variables, and forgets to get
 Thomas> $(HOST_DIR)/usr/bin in its PATH. This prevents gcc from finding and
 Thomas> using host tools built by Buildroot.

 Thomas> This patch therefore ensures that $(HOST_MAKE_ENV) or
 Thomas> $(TARGET_MAKE_ENV) are passed at the appropriate locations. It will be
 Thomas> useful for a later patch that makes gcc depend on host-flex/host-bison
 Thomas> in some situations.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
