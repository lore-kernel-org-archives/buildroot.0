From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 09:44:09 +0100
Subject: [Buildroot] [PATCH] elfutils: security bump to version 0.174
In-Reply-To: <20181112224431.11501-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 12 Nov 2018 23:44:31 +0100")
References: <20181112224431.11501-1-peter@korsgaard.com>
Message-ID: <87pnusz0rq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2018-16062: dwarf_getaranges in dwarf_getaranges.c in libdw in elfutils
 > before 2018-08-18 allows remote attackers to cause a denial of service
 > (heap-based buffer over-read) via a crafted file.

 > CVE-2018-16402: libelf/elf_end.c in elfutils 0.173 allows remote attackers
 > to cause a denial of service (double free and application crash) or possibly
 > have unspecified other impact because it tries to decompress twice.

 > CVE-2018-16403: libdw in elfutils 0.173 checks the end of the attributes
 > list incorrectly in dwarf_getabbrev in dwarf_getabbrev.c and dwarf_hasattr
 > in dwarf_hasattr.c, leading to a heap-based buffer over-read and an
 > application crash.

 > For more details, see the announcement:
 > https://sourceware.org/ml/elfutils-devel/2018-q3/msg00116.html

 > 0.172 and 0.173 also included fixes for crashes and hangs found by afl-fuzz
 > (no CVEs assigned):
 > https://sourceware.org/ml/elfutils-devel/2018-q2/msg00272.html
 > https://sourceware.org/ml/elfutils-devel/2018-q2/msg00209.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
