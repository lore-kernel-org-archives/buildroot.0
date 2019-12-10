From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 14:09:49 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix build failure on
 powerpc without <sys/auxv.h>
In-Reply-To: <20191210121322.120920-1-giulio.benetti@benettiengineering.com>
References: <20191210121322.120920-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191210140949.72b3cf96@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Dec 2019 13:13:22 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add patch to fix build failure on PowerPc without <sys/auxv.h>. The patch
> inserts #if statements to include or note <sys/auxv.h> prior it exists.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8bf95bd8a0aec8c53889308ab1e00d0a94f53d57/

When is this header file available/not available? Is it a glibc vs.
musl vs. uClibc thing? Something else?

I'm not really a big fan of solutions that simply consist in "it wants
this file, this file is not available, so let's make it ignore it",
without a deeper investigation.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
