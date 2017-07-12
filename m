From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Jul 2017 07:54:31 +0000
Subject: [Buildroot] [Bug 9441] Link BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 to BR2_ENABLE_DEBUG
In-Reply-To: <bug-9441-163@https.bugs.busybox.net/>
References: <bug-9441-163@https.bugs.busybox.net/>
Message-ID: <bug-9441-163-UMlLEheacM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9441

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
While I understand your reasoning, I don't think we want to do that. Indeed,
some people like you need debugging symbols to use with gdbserver on the
target. But there are lots of other use cases for building with debugging
symbols:

 - Using the full blown gdb directly on the target
 - Using tools like objdump/readelf on the host, without necessarily needing
gdbserver on the target

Hence, I don't think we want to tie building with debugging symbols with having
gdbserver copied to the target.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
