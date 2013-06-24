From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jun 2013 13:45:09 +0200
Subject: [Buildroot] [PATCH] gvfs: Depend on libgcrypt if it is selected
In-Reply-To: <1371825691-27746-1-git-send-email-markos.chandras@gmail.com>
 (Markos Chandras's message of "Fri, 21 Jun 2013 15:41:31 +0100")
References: <1371825691-27746-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <87obavivga.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

 Markos> From: Markos Chandras <markos.chandras@imgtec.com>
 Markos> gvfs can make optional use of libgcrypt so it needs to depend on
 Markos> it if it is selected. It's also necessary to set the
 Markos> ac_cv_path_LIBGCRYPT_CONFIG variable to a known value in order
 Markos> to prevent the AM_PATH_LIBGCRYPT macro from searching the host
 Markos> paths for the libgcrypt-config script.

 Markos> Fixes the following build problem when libgcrypt is installed on the
 Markos> host system but the package is not selected in buildroot:

 Markos> gvfsbackendafpbrowse.c:31:20: fatal error: gcrypt.h: No such file or directory

Committed, thanks.

-- 
Bye, Peter Korsgaard
