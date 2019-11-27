From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Nov 2019 08:35:33 +0000
Subject: [Buildroot] [Bug 12166] Compiling nodejs for SAMA5D3 always crash
 with illegal instruction
In-Reply-To: <bug-12166-163@https.bugs.busybox.net/>
References: <bug-12166-163@https.bugs.busybox.net/>
Message-ID: <bug-12166-163-eKJo4uypqt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12166

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
It seems like the nodejs build system is overriding the mfpu flag, and
OpenEmbedded has a patch to remove this logic, see
https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM-CFLAGS.patch.

Could you try to apply this patch to nodejs, and see if it fixes the issue for
you ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
