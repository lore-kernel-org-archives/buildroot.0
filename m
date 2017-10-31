From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Oct 2017 16:27:42 +0000
Subject: [Buildroot] [Bug 10471] Building a mipsel kernel format vmlinuz (+
 gzip + initrd) generates non-compressed, non-bootable image
In-Reply-To: <bug-10471-163@https.bugs.busybox.net/>
References: <bug-10471-163@https.bugs.busybox.net/>
Message-ID: <bug-10471-163-Sxw6u2eeNo@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10471

--- Comment #2 from Alexander Enchevich <a.enchevich@gmail.com> ---
Reading the above perhaps a quick clarification is in order to help understand
why I believe the vmlinuz produced by buildroot is significantly smaller then
it should be (and hence, IMO, is missing the initial ram disk):

Good vmlinuZ (from Broadcom):
compressed:    6 MB
uncompressed: 13 MB


Good vmlinuX (from buildroot):
compressed:    9 MB
uncompressed: 21 MB


BAD vmlinuZ (from buildroot):
compressed:    9 MB (8.8)
uncompressed:  9 MB (8.7)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
