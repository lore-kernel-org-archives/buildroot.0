From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:20:03 +0200
Subject: [Buildroot] [PATCH] mesa3d-headers: fix logic to generate the
 dri.pc file
In-Reply-To: <20180810214632.21735-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 10 Aug 2018 23:46:32 +0200")
References: <20180810214632.21735-1-thomas.petazzoni@bootlin.com>
Message-ID: <87sh34kwgc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > As noted by Arnout in [1], the logic in mesa3d-headers.mk generates a
 > bogus dri.pc file, which looks like this:

 > prefix=/usr
 > exec_prefix=/usr
 > libdir=/lib
 > includedir=/include
 > dridriverdir=/dri

 > Indeed, the ${...} are expanded as shell variables when the sed
 > command is executed, while the intention is that those ${...} should
 > go in the .pc file. By escaping those using $${...}, we get the
 > expected .pc file:

 > prefix=/usr
 > exec_prefix=/usr
 > libdir=${exec_prefix}/lib
 > includedir=${prefix}/include
 > dridriverdir=${libdir}/dri

 > This was detected by the not yet committed check-package improvement
 > from Ricardo that detects bogus ${...} usage to reference make
 > variables.

 > [1] http://lists.busybox.net/pipermail/buildroot/2018-July/225402.html

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
