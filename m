From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Sep 2016 23:19:42 +0000
Subject: [Buildroot] [Bug 9296] Buildroot Fails on applying patches
In-Reply-To: <bug-9296-163@https.bugs.busybox.net/>
References: <bug-9296-163@https.bugs.busybox.net/>
Message-ID: <bug-9296-163-hQJYeqBQEh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9296

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
> make -C buildroot/ BR2_TOOLCHAIN_EXTERNAL_PATH=$(pwd)/toolchain ARCH=ARM all

Passing ARCH=ARM breaks the build. Why do you do this?

Also passing BR2_TOOLCHAIN_EXTERNAL_PATH on the command line is not a great
idea, it should be set in the .config.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
