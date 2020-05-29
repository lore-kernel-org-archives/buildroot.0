From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 29 May 2020 09:38:10 +0000
Subject: [Buildroot] [Bug 12946] Grub: Decompressor is too big.
In-Reply-To: <bug-12946-163@https.bugs.busybox.net/>
References: <bug-12946-163@https.bugs.busybox.net/>
Message-ID: <bug-12946-163-j6VsPRKJat@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12946

--- Comment #10 from Stefan Walter <stefan.walter@iml.fraunhofer.de> ---
(In reply to Yann E. MORIN from comment #8)

I have attached a small defconfig that I can reproduce the problem with.
Without the patch, output/host/lib/grub/i386-pc/lzma_decompress.img has a size
of 134479600 bytes, which is what causes the actual error with grub-mkimage;
with the patch, the file's size is only 2864 bytes.

The exact compiler version used by me is: c++ (Ubuntu 9.2.1-9ubuntu2) 9.2.1
20191008.

Best regards,
Stefan

p.s.: Please note that neither was it obvious which issue you were referring
to, nor does mentioning the Ubuntu version clearly indicate which GCC version
you're using. While the default compiler on Ubuntu 19.10 seems to be GCC 9,
there are two more GCC versions in the package repository for you to choose
from, of which one the problem does not seem to occur with (according to the
report I linked to).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
