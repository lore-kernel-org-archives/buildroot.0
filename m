From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 Nov 2019 17:53:11 +0000
Subject: [Buildroot] [Bug 12316] tzdata fails to install with empty "default
 local time"
In-Reply-To: <bug-12316-163@https.bugs.busybox.net/>
References: <bug-12316-163@https.bugs.busybox.net/>
Message-ID: <bug-12316-163-9D5Bot419i@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12316

--- Comment #4 from Andrew Trapani <andrew.trapani@ontera.bio> ---
I replied to the email, but it didn't respond here. Inconvenient....

Thank Yann,

(This is my first time with a patch)

How to make sure it re-builds tzdata? Or maybe it worked?


Looks like the "mbox" button gives me a .patch file on the webpage. Excellent

I could add it to "br2-patches" and it gets used when I go to menuconfig:
Applying patch:
system-allow-not-setting-a-default-system-wide-time-zone.patch...
patching file package/tz/tz.mk
patching file package/tzdata/tzdata.mk
Hunk #1 succeeded at 25 (offset -1 lines).
Hunk #2 succeeded at 47 (offset -1 lines).
patching file system/Config.in
Hunk #1 succeeded at 481 (offset -13 lines).
Removing intermediate container e9bde13f6ee5
 ---> 8bc39f5e0e49

1. Copy ".patch" file into br2-patches
2. Go to menuconfig.
3. Note the patch is actually applied
4. Go to System Configuration
5. Modify "default local time"
6. Change from "Etc/UTC" to empty.
7. F6 to save and F9 to exit
8. Note: No errors on save and exit
9. Start the build and save all output to a file (stdout and stderr)
10. Wasn't able to find "tzdata" in the output

-- 
You are receiving this mail because:
You are on the CC list for the bug.
