From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 00:35:32 +0200
Subject: [Buildroot] [PATCH] gdb: fix build for MIPS musl
In-Reply-To: <20170619141807.16084-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Mon, 19 Jun 2017 15:18:07 +0100")
References: <20170619141807.16084-1-Vincent.Riera@imgtec.com>
Message-ID: <874lv3k85n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Currently building gdb for MIPS musl fails because it's trying to
 > include <sgidefs.h> which is provided by glibc and uClibc, but not by
 > musl.

 > However, the kernel headers provide <asm/sgidefs.h> which has the same
 > definitions, so we can use that one instead.

 > Backporting a patch that has been sent upstream. Taken from here:

 > https://sourceware.org/bugzilla/show_bug.cgi?id=21070

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed to 2017.02.x after dropping the 7.12.1 / 8.0 patches, thanks.

-- 
Bye, Peter Korsgaard
