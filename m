From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 May 2020 18:47:50 +0000
Subject: [Buildroot] [Bug 12761] Buildroot fails when building GCNano
 binaries for the STM32MP1
In-Reply-To: <bug-12761-163@https.bugs.busybox.net/>
References: <bug-12761-163@https.bugs.busybox.net/>
Message-ID: <bug-12761-163-x9JmI9ORIC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12761

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
(In reply to Aaron Decker from comment #2)
You're seeing an issue in include/linux/module.h due to a compatibility problem
with gcc 9.x. However, this was fixed in upstream Linux and in the ST fork,
since version v4.19-stm32mp-r1.5.

Could you try building with v4.19-stm32mp-r3.1 instead ?

Nevertheless, this is not a Buildroot bug.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
