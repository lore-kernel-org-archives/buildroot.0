From: Mike Zick <minimod@morethan.org>
Date: Sun, 15 Jun 2014 08:40:49 -0500
Subject: [Buildroot] [Bug 7208] New: Glibc C++ aplications crash if they
 use exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140615084049.4da9c3f3@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Jun 2014 10:29:22 +0000 (UTC)
bugzilla at busybox.net wrote:

> In the discussion with tom_kos and wbx on IRC we managed to pin the
> problem libgcc_s.so. The problem only appears when linking with
> dynamic libgcc_s.so. If the program is compiled with -static-libgcc
> it runs correctly.
>

The file libgcc_s.so is an ascii text, linker script.
It should be patchable.

PS: It is being installed to the target -
My guess, it matches the pattern used to transfer libgcc_s.so.1
(which is a dynamic library binary).

Mike
