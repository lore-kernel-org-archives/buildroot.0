From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Feb 2020 15:29:21 +0000
Subject: [Buildroot] [Bug 12526] host-nodejs 12.14.1: configure fail:
 AttributeError: 'module' object has no attribute 'sha1'
In-Reply-To: <bug-12526-163@https.bugs.busybox.net/>
References: <bug-12526-163@https.bugs.busybox.net/>
Message-ID: <bug-12526-163-MsC1tO8JNz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12526

Aleksandr Makarov <seems.deviant@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Aleksandr Makarov <seems.deviant@gmail.com> ---
I've found a solution to that. It appears that customizing Target Architecture
Variant to a non-default value fixes the issue. I've changed from nocona
(default) to steamroller and that fixed the issue.

$ make menuconfig
 Target options  --->
  Target Architecture Variant (steamroller)  --->

-- 
You are receiving this mail because:
You are on the CC list for the bug.
