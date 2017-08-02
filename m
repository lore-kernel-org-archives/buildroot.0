From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Aug 2017 20:48:12 +0000
Subject: [Buildroot] [Bug 10071] [PATCH] fakeroot: replace hard-coded paths
 in post install
In-Reply-To: <bug-10071-163@https.bugs.busybox.net/>
References: <bug-10071-163@https.bugs.busybox.net/>
Message-ID: <bug-10071-163-kWhh8ZjvgD@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10071

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This issue has been fixed by the relocatable SDK work. The idea is that after a
build, you run "make sdk", which prepares the SDK to be relocable. Then you can
move the contents of output/host/ around, you can tarball it and share it with
other developers. output/host contains a relocate-sdk.sh script, which one must
run before using the SDK. This script will adjust the hardcoded paths as
needed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
