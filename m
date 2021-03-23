From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Mar 2021 20:01:39 +0000
Subject: [Buildroot] [Bug 13671] openSSH server closes connection before
 authentication is finished
In-Reply-To: <bug-13671-163@https.bugs.busybox.net/>
References: <bug-13671-163@https.bugs.busybox.net/>
Message-ID: <bug-13671-163-XNqymzSLOF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13671

--- Comment #2 from Matt Weber <matthew.weber@rockwellcollins.com> ---
We've noticed a similar issue and haven't quite narrowed it down. So far what
we observed is that everything works on a 2020.02 LTS through the latest master
with a GCC8.x Buildroot internal toolchain.  However, when we switched to
GCC9.x (bootlin stable toolchain) while using 2020.02 LTS we noticed this same
behavior with packet type 50 (https://tools.ietf.org/html/rfc4252#section-6 ).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
