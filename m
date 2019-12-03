From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Dec 2019 16:34:31 +0100
Subject: [Buildroot] [PATCH 1/3] package/nodejs: properly pass the
 --with-arm-float-abi on ARM
In-Reply-To: <20191127203648.291701-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 27 Nov 2019 21:36:46 +0100")
References: <20191127203648.291701-1-thomas.petazzoni@bootlin.com>
 <20191127203648.291701-2-thomas.petazzoni@bootlin.com>
Message-ID: <87v9qxl8xk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When commit 0064132ba032da39cefa4fffe59c31a71d1f1ddb introduced ARM64
 > support in nodejs.mk, it incorrectly kept the NODEJS_ARM_FP
 > definition. This variable is used to pass --with-arm-float-abi, which
 > in NodeJS's configure.py script is only used when --dest-cpu=arm, and
 > not when --dest-cpu=arm64.

 > So we are passing --with-arm-float-abi=<something> for ARM64, which
 > has no effect, and we are no longer passing it on ARM.

 > This commit fixes that by putting the NODEJS_ARM_FP definition back at
 > the right location.

 > Fixes:

 >    0064132ba032da39cefa4fffe59c31a71d1f1ddb

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
