From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 1 Jul 2015 09:45:48 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-06-29
In-Reply-To: <20150630140738.526d72b8@free-electrons.com>
References: <20150630063014.44429100A75@stock.ovh.net>
 <20150630140738.526d72b8@free-electrons.com>
Message-ID: <1435743947.4689.24.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> >          arc |           binutils-arc-2014.12 | NOK | http://autobu
> > ild.buildroot.net/results/1fc2d68ade3dae813b13ca88448b30f2cb43c61e/
> 
> Fixed by http://git.buildroot.net/buildroot/commit/?id=89d4a209f5abf7
> 1194325a9b91ee561673d31e92.

Thanks for that. I started to look at this one and didn't understand
right away how binutils of version arc-2014.12 were put in the picture.
I missed the fact that it was internal toolchain and we requested
binutils to be built anyways.

> >          arc |   host-gdb-arc-2015.06-rc1-gdb | NOK | http://autobu
> > ild.buildroot.net/results/2b27a4a64c0b225ae479ecfccf7a97f5ea95598c/
> 
> The infamous static/shared issue when building gdb. Romain, I thought
> we had fixed this problem. Did we miss a patch?

Fixed by http://git.buildroot.net/buildroot/commit/?id=837654c2bfd564fb
a47857caf7cacbb2cb737082

> >          arc |                  lvm2-2.02.121 | NOK | http://autobu
> > ild.buildroot.net/results/9888a7a30538c9851f4910c16674d8dbb8edeb8f/
> 
> BFD (GNU Binutils) 2.23.2 assertion fail elf32-arc.c:3018
> 
> Alexey, this seems like a toolchain issue. Can you have a look?

Filed an internal STAR 9000921771 against that issue. Once I have more
information on that one I'll take an action.

> >          arc |                openswan-2.6.43 | NOK | http://autobu
> > ild.buildroot.net/results/91d2d49916b77e52ed4c57ca8e8462623c2bafe6/
> 
> parallel build issue it seems. Gustavo, maybe?

Hm I cannot reproduce this one. Any thoughts, suggestions?

> >          arc |                   zeromq-4.0.5 | NOK | http://autobu
> > ild.buildroot.net/results/e76c5cb755f90d8bef83f370ee681fbb35a8a4ba/
> 
> socket_base.cpp: In member function 'void 
> zmq::socket_base_t::event_connected(std::string&, int)':
> socket_base.cpp:1157:1: error: Internal consistency failure: cfi row 
> mismatch [-Werror]
>  }
> 
> Seems to be an ARC toolchain issue. Alexey, can you have a look?

Indeed this is a known problem and it is already fixed in https://githu
b.com/foss-for-synopsys-dwc-arc
-processors/gcc/commit/24d956f3dced0e9abb6b8b140d44061628e0e57f

That means it will make its way in arc-2015.06-rc2.
Do you think we may just wait for rc2 to be cut or you prefer me to add
mentioned fix as a patch to gcc?

-Alexey
