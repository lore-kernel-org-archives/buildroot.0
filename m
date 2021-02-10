From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 19:58:27 +0100
Subject: [Buildroot] [PATCH] package/python3: add upstream security fix
 for CVE-2021-3177
In-Reply-To: <20210205130756.17142-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 5 Feb 2021 14:07:56 +0100")
References: <20210205130756.17142-1-peter@korsgaard.com>
Message-ID: <878s7vn418.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2021-3177: Python 3.x through 3.9.1 has a buffer overflow in
 >   PyCArg_repr in _ctypes/callproc.c, which may lead to remote code execution
 >   in certain Python applications that accept floating-point numbers as
 >   untrusted input, as demonstrated by a 1e300 argument to
 >   c_double.from_param.  This occurs because sprintf is used unsafely.

 > For details, see the advisory:
 > https://python-security.readthedocs.io/vuln/ctypes-buffer-overflow-pycarg_repr.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.11.x, thanks.

I'll backport a similar patch for 3.8 for 2020.02.x.

-- 
Bye, Peter Korsgaard
