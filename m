From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Sep 2018 09:39:20 +0000
Subject: [Buildroot] [Bug 11331] Internal application no longer builds with
 latest GIT master
In-Reply-To: <bug-11331-163@https.bugs.busybox.net/>
References: <bug-11331-163@https.bugs.busybox.net/>
Message-ID: <bug-11331-163-e8GOqJglmN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11331

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This is a decision from glibc upstream, which removed those functions from
glibc 2.28. See
https://lists.gnu.org/archive/html/info-gnu/2018-08/msg00000.html, which says:

"""
* The obsolete functions encrypt, encrypt_r, setkey, setkey_r, cbc_crypt,
  ecb_crypt, and des_setparity are no longer available to newly linked
  binaries, and the headers <rpc/des_crypt.h> and <rpc/rpc_des.h> are no
  longer installed.  These functions encrypted and decrypted data with the
  DES block cipher, which is no longer considered secure.  Software that
  still uses these functions should switch to a modern cryptography library,
  such as libgcrypt.
"""

So, you should fix your application it seems. Buildroot is not going to revert
this change, unless you can convince glibc upstream developers to also revert
it, which I guess will be challenging.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
