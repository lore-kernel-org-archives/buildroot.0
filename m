From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Feb 2014 18:03:44 +0000 (UTC)
Subject: [Buildroot] [Bug 4339] Allow override of DL_DIR in extract step
In-Reply-To: <bug-4339-163@https.bugs.busybox.net/>
References: <bug-4339-163@https.bugs.busybox.net/>
Message-ID: <20140210180344.54F549C952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4339

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #3 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-10 18:03:44 UTC ---

Other buildroot developers agree that this patch is very project specific and
should not be applied to mainline buildroot.

Please consider the following alternatives:

 * The "file" site method can be used to "download" tarballs from a
   local directory, when needed.

 * The licensing infrastructure allows to create a directory with all
   the open-source tarballs, keeping them separate from proprietary
   bits, for delivery to customers.

 * You may also be interested in the new BR2_EXTERNAL mechanism,
   introduced in buildroot 2014.02 (to be released at the end of this
   month).


Also note that supporting highly-specific use cases in the
package infrastructure is not a good idea, because we might very easily
break them in the future if they are too specific and therefore not
used by enough people to be tested when we make changes.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
