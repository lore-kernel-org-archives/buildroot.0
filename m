From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 14:45:01 +0100
Subject: [Buildroot] [PATCH-2019.02] package/glibc: bump version for
 additional post-2.28 security fixes
In-Reply-To: <20190329094714.10437-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 29 Mar 2019 10:47:14 +0100")
References: <20190329094714.10437-1-peter@korsgaard.com>
Message-ID: <87muldkd5u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 >   CVE-2019-6488: On x32, the size_t parameter may be passed in the lower
 >   32 bits of a 64-bit register with with non-zero upper 32 bit.  When it
 >   happened, accessing the 32-bit size_t value as the full 64-bit register
 >   in the assembly string/memory functions would cause a buffer overflow.
 >   Reported by H.J. Lu.

 >   CVE-2019-7309: x86-64 memcmp used signed Jcc instructions to check
 >   size.  For x86-64, memcmp on an object size larger than SSIZE_MAX
 >   has undefined behavior.  On x32, the size_t argument may be passed
 >   in the lower 32 bits of the 64-bit RDX register with non-zero upper
 >   32 bits.  When it happened with the sign bit of RDX register set,
 >   memcmp gave the wrong result since it treated the size argument as
 >   zero.  Reported by H.J. Lu.

 >   CVE-2016-10739: The getaddrinfo function could successfully parse IPv4
 >   addresses with arbitrary trailing characters, potentially leading to data
 >   or command injection issues in applications.

 >   CVE-2019-9169: Attempted case-insensitive regular-expression match
 >   via proceed_next_node in posix/regexec.c leads to heap-based buffer
 >   over-read.  Reported by Hongxu Chen.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
