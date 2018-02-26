From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 20:56:41 +0100
Subject: [Buildroot] [PATCH] php: fix build on C libraries that don't
 provide AI_IDN
In-Reply-To: <20180226181711.31203-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 26 Feb 2018 19:17:11 +0100")
References: <20180226181711.31203-1-thomas.petazzoni@bootlin.com>
Message-ID: <87po4rr0cm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The PHP sockets module now provides access to AI_IDN functionality (by
 > simply declaring a bunch of constants available from PHP code). AI_IDN
 > (internationalized domain names) is not supported in uClibc or musl,
 > which breaks the build.

 > This commit adds a patch to PHP which makes the use of AI_IDN
 > conditional, in a way that is identical to what is already done for
 > AI_ALL. The patch has been submitted upstream.

 > Fixes:

 >   http://autobuild.buildroot.net/results/ef040cc45bb2789ead82a8c445db3376e36b5ac7/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
