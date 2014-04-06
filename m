From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Sun, 06 Apr 2014 15:02:07 +0200
Subject: [Buildroot] [PATCH] libuci: Lua binding needs mmu and version
 5.1
In-Reply-To: <1396708617-7364-1-git-send-email-yegorslists@googlemail.com>
References: <1396708617-7364-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <5341504F.1060301@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yegor,

On Sat, 5 Apr 2014 16:36:57 +0200, Yegor Yefremov wrote:
> The Lua binding option of libuci uses fork() so it needs the MMU.

The Lua binding of libuci doesn't use fork() unlike the libubox one,
therefore the patches are not the same. You could simply check in its
source directory with:

$ ack -c --cc fork lua/
lua/uci.c:0

or

$ grep -c fork lua/uci.c
0

So it doesn't need the MMU and you can remove:

> +ifeq ($(BR2_USE_MMU),y) # fork()
>
> (...)
>
> +endif # MMU

However I agree with the other changes (corrected by Thomas), the Lua
binding of libuci suffers from the same dirty CMakeLists.txt than
libubox ;-).

Regards,

Hadrien
