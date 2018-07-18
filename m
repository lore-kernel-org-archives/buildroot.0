From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 23:51:25 +0200
Subject: [Buildroot] [PATCH 1/1] patchelf: Add patch to fix relative
 rpath issue on PPC
In-Reply-To: <20180625214407.12687-1-bryce.ferguson@rockwellcollins.com>
 (Bryce Ferguson's message of "Mon, 25 Jun 2018 16:44:07 -0500")
References: <20180625214407.12687-1-bryce.ferguson@rockwellcollins.com>
Message-ID: <878t68gqle.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bryce" == Bryce Ferguson <bryce.ferguson@rockwellcollins.com> writes:

 > This commit adds a patch to the host package patchelf to fix an
 > issue with endianness when the --make-rpath-relative option is
 > specified. Currently, patchelf does not take into account the
 > architecture of the target ELF when it performs the fixup on the
 > RPATH. Thus, if it differs from the host in endianness, the RUNPATH
 > field will be invalid. The patch fixes the bug reported here:

 > https://bugs.busybox.net/show_bug.cgi?id=11101

 > Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
