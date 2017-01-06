From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 Jan 2017 18:54:30 +0000
Subject: [Buildroot] [Bug 9566] [kmod] Compilation fails with uclibc
In-Reply-To: <bug-9566-163@https.bugs.busybox.net/>
References: <bug-9566-163@https.bugs.busybox.net/>
Message-ID: <bug-9566-163-z86vNCVD7B@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9566

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
The uClibc-ng patch has now been applied:

commit ffad94e6ddde09c8388bdc0b5f825ddf77702182
Author: Waldemar Brodkorb <wbx@openadk.org>
Date:   Wed Dec 28 18:29:01 2016 +0100

    uclibc: add kernel module syscall wrappers

    Revert the decision to remove the wrappers, but remove the extra
    Config symbol and add it by default. Required for kmod package.

    Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
You are receiving this mail because:
You are on the CC list for the bug.
