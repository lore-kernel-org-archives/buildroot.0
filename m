From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 Dec 2016 08:22:55 +0200
Subject: [Buildroot] [musl] cortex-m support?
In-Reply-To: <7c500379-491b-3099-bef7-5b3a3e0bf354@mind.be>
References: <04e5a294-719e-8029-704f-a57d1ec935b0@landley.net>
 <20161208211116.GO1555@brightrain.aerifal.cx>
 <7bfe2625-725d-d1bb-7177-f2d31ce09e9c@landley.net>
 <20161215185123.GX15584@waldemar-brodkorb.de>
 <48fb6c09-9dcb-e563-dc2d-f30062c5fceb@landley.net>
 <7c500379-491b-3099-bef7-5b3a3e0bf354@mind.be>
Message-ID: <20161221062255.bxdo7qml4sonefam@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Dec 21, 2016 at 12:37:47AM +0100, Arnout Vandecappelle wrote:
> > I used to prod other projects to support uClibc too. For example, it
> > took me three years to finally convince qemu to stop being incompatible
> > with uClibc static binaries on powerpc, but they finally made the change:
> 
>  Then you have your work cut out with musl... In Buildroot, we currently have 48
> packages that are excluded on musl, and 114 that need to be patched to be able
> to build with musl. And that's not taking into account the global hacks we
> introduced for musl: cdefs.h, queue.h, linux headers patching...

Would you suggest musl to define __GLIBC__[1] and __USE_MISC[2]?

>  The problem with musl is that the world is not posix :-/  Ignoring this fact
> moves the problems from libc to distros.

Part of the problem is that the kernel sees the world as glibc only.

[1] https://git.busybox.net/buildroot/commit/?id=196932cd91ef5d58bd3142bbea939fb55636a540
[2] https://git.busybox.net/buildroot/commit/?id=4470dd9b1bdbb9b39e9fb13f27bcaa044719de6d

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
