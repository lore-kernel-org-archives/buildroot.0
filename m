From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Jun 2019 20:20:58 +0000
Subject: [Buildroot] [Bug 11776] qt5webengine 5.12.2 build failed with arm
 toolchain and linaro toolchain
In-Reply-To: <bug-11776-163@https.bugs.busybox.net/>
References: <bug-11776-163@https.bugs.busybox.net/>
Message-ID: <bug-11776-163-lMbxwbn8ft@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11776

--- Comment #2 from fazibear at gmail.com ---
Hello,

For sure it's a bug related to -isystem` bug. It was fixed earlier but maybe
something changed. 

https://github.com/buildroot/buildroot/commit/3a0ed5d25e26cb2ec99a1da077c9dcfea67b0ecc 

Removing -isystem <path> lines from ninja file when <path> is the path to your
toolchain include dir make it works. But ninja files are generated.

regards,

-- 
You are receiving this mail because:
You are on the CC list for the bug.
