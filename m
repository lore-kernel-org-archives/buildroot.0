From: iks hefem <ikshefem@gmail.com>
Date: Wed, 31 Jan 2007 09:14:35 +0100
Subject: [Buildroot] Kernel building & patching
Message-ID: <78e18a710701310014u4af05590l2ad50fff271024db@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, I would like to have my kernel built by busybox, which I enabled
(under a strange config option named "board support") : This allows me
to automatically put modules to the generated root filesystem.

However, I'd like it generate a squashfs root, so I must either :
- patch the kernel to support squashfs to use modules (but I haven't
found a way to do this and keep your patches when you make clean,
- build a static module, which fails because the building script seems
to call depmod unconditionnally
- or use cramfs (which is in vanilla, but I'd prefer squashfs)

Which solution is the "right" one / would you recommend ?

By the way, what is the correct svn upgrade path ? I'm genrally forced
to do a  make dirclean (which fails with ccache but cleans somewhat
the mess)  then make clean then make each time I svn up, is that the
right way ?

thx,

     Ikse Hefem
