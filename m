From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 19:14:51 +0100
Subject: [Buildroot] [PATCH next v6 02/10]
 support/scripts/check-host-rpath: split condition on two statements
In-Reply-To: <20181123145815.13008-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 23 Nov 2018 15:58:07 +0100")
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-3-thomas.petazzoni@bootlin.com>
Message-ID: <871s77u2n8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Inside the check_elf_has_rpath(), we check if the host binary has a
 > correct RPATH, which should be either an absolute path to
 > $(HOST_DIR)/lib, or a relative path using $ORIGIN. Those two
 > conditions are checked in a single statements, but as we are going to
 > add a third condition, let's split this up a bit:

 >  - If we have a RPATH to $(HOST_DIR)/lib -> we're good, return 0
 >  - If we have a RPATH to $ORIGIN/../lib -> we're good, return 0
 >  - Otherwise, we will exit the loop, and return 1

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
