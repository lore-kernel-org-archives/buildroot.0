From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 31 Oct 2012 13:41:18 +0200
Subject: [Buildroot] RPC.h and busybox
In-Reply-To: <CABtOAfwBq_mbzxnaBd8s0Wu4PeYOiVWUr5AXoZCcaxL5o=T4MQ@mail.gmail.com>
References: <CABtOAfwBq_mbzxnaBd8s0Wu4PeYOiVWUr5AXoZCcaxL5o=T4MQ@mail.gmail.com>
Message-ID: <20121031114118.GF30343@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander,

On Wed, Oct 31, 2012 at 02:32:08PM +0300, Alexander Khryukin wrote:
> I'm trying to build busybox with glibc
> and faced with error
> 
> util-linux/mount.c:140:22: fatal error: rpc/rpc.h: No such file or directory

glibc version newer than 2.13 omits built time support for RPC. See 
http://sourceware.org/ml/crossgcc/2011-09/msg00005.html.

> Does anybody have any solution?

This is a toolchain level problem. Either downgrade to a toolchain with 2.13 
glibc, or use a toolchain with tirpc.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
