From: Cam Hutchison <camh@xdna.net>
Date: Mon, 4 Sep 2017 06:30:18 +1000
Subject: [Buildroot] [PATCH 1/1] toolchain: detect external glibc in
	symlinked /lib
In-Reply-To: <20170903124925.GA2786@scaer>
References: <20170903120835.16190-1-camh@xdna.net>
 <20170903141738.20c0d621@windsurf.lan>
 <CABa6e=pwRghNUx+WHY_AH22_Wh8mtvR54x8ApqH3Y11732mhng@mail.gmail.com>
 <20170903142517.088907a8@windsurf.lan> <20170903124925.GA2786@scaer>
Message-ID: <CABa6e=ryNCOgtrOBzNbb1CM8F=+wQ-DtvGMbWRB2f0GKrQ7xLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3 September 2017 at 22:49, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Cam, what about the fiollowing:
>
>     toolchain: detect external glibc in merged /usr
>
>     When using an external toolchain that was built with Buildroot and a
>     merged /usr., the dynamic linker is actually in /usr/lib.
>
>     But the check_glibc macro only limits the depth it is looking for
>     the dynamic linker, anf misses it when it is in /usr/lib because it
>     is too deep.
>
>     WE could fix that in two ways: increase the depth in which we look
>     for it, or follow symlinks. We choose the second solution.
>
>     Signed-off-by: you
>     Cc: Thomas P.
>     Cc: Thomas DS.
>     Cc: Me
>
> What do you all think about this? ;-)

LGTM. I'll resend shortly.

Thanks,
Cam
