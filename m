From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 May 2020 07:34:22 +0000
Subject: [Buildroot] [Bug 12586] avahi failure
In-Reply-To: <bug-12586-163@https.bugs.busybox.net/>
References: <bug-12586-163@https.bugs.busybox.net/>
Message-ID: <bug-12586-163-c2lixdnBaq@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12586

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Hello Sam. You can write your own filesystem image logic in Buildroot, so that
you can re-use everything Buildroot does under "fakeroot", such as creating
users, adjusting permissions and ownerships, etc. I  believe you can even add
your own filesystem format in your separate BR2_EXTERNAL tree, if you're using
that.

In any case, there's nothing to fix in Buildroot here: we explicitly state that
the contents of output/target is not the final root filesystem, and this cannot
be changed as Buildroot does not run as root.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
