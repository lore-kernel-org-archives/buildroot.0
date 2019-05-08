From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 May 2019 15:40:14 +0200
Subject: [Buildroot] [PATCH] package/atftp: security bump to version
 0.7.2
In-Reply-To: <20190508063519.27686-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 8 May 2019 08:35:19 +0200")
References: <20190508063519.27686-1-peter@korsgaard.com>
Message-ID: <874l65jc8x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2019-11365: An issue was discovered in atftpd in atftp 0.7.1.  A remote
 > attacker may send a crafted packet triggering a stack-based buffer overflow
 > due to an insecurely implemented strncpy call.  The vulnerability is
 > triggered by sending an error packet of 3 bytes or fewer.  There are
 > multiple instances of this vulnerable strncpy pattern within the code base,
 > specifically within tftpd_file.c, tftp_file.c, tftpd_mtftp.c, and
 > tftp_mtftp.c.

 > CVE-2019-11366: An issue was discovered in atftpd in atftp 0.7.1.  It does
 > not lock the thread_list_mutex mutex before assigning the current thread
 > data structure.  As a result, the daemon is vulnerable to a denial of
 > service attack due to a NULL pointer dereference.  If thread_data is NULL
 > when assigned to current, and modified by another thread before a certain
 > tftpd_list.c check, there is a crash when dereferencing current->next.

 > For details, see
 > https://pulsesecurity.co.nz/advisories/atftpd-multiple-vulnerabilities

 > Patch 0001-Makefile.am-link-against-libpthread-for-atftp.patch patches
 > Makefile.am, so add _AUTORECONF.

 > CFLAGS is now correctly handled since commit f9dbb96844167f (configure.ac:
 > fix hard setting of CFLAGS), so drop the workaround about passing
 > -fgnu89-inline in CPPFLAGS.

 > Add a hash for the license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
