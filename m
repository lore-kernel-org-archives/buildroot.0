From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 May 2014 22:54:48 +0200
Subject: [Buildroot] [PATCH] popt: fix build issue due to glob functions
	on Blackfin
In-Reply-To: <1399402790-7465-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 6 May 2014 20:59:50 +0200")
References: <1399402790-7465-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878uqefx0n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > While the Blackfin external uClibc toolchains have <glob.h>, they
 > don't implement all the functions needed by popt, causing build
 > failures. One solution would have been to disable popt with such
 > toolchains, but this would have meant propagating this additional
 > dependency to the numerous reverse dependencies of popt. Instead, this
 > commit chooses to make popt build on Blackfin external toolchains by
 > disabling the usage of <glob.h> functions altogether.

 > Fixes:

 >   http://autobuild.buildroot.org/results/bfc/bfcb2ed27debafc584e133f5ae11ad2061ad2b16/build-end.log
 >   http://autobuild.buildroot.org/results/410/410c8f3a0c7ca2c7098a47c30088038411635ae4/build-end.log

 > and gazillion of similar failures.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
