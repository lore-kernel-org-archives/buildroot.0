From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Nov 2018 16:43:47 +0100
Subject: [Buildroot] [PATCH 1/2] package/opengl/libgbm: new virtual
 package
In-Reply-To: <CABhNV23smKagYKYME1Na=Cyz0+hn2BPOEpKumruu3OyAmLt1fw@mail.gmail.com>
References: <20180913194410.24077-1-bernd.kuhls@t-online.de>
 <20181030221420.65c7aed3@windsurf>
 <20181105124735.3qbms4ymnrgpw3op@flea>
 <CABhNV23smKagYKYME1Na=Cyz0+hn2BPOEpKumruu3OyAmLt1fw@mail.gmail.com>
Message-ID: <20181105164347.4bd8d103@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Nov 2018 16:35:02 +0100, Einar J?n wrote:

> I'm not much help here.
> My only concern was building QT5 on an embedded AM335x with ti-sgx-*
> libraries and update the kernel to 4.9 (bumping TI SDK from 2.0 to
> 4.0).
> There is now a kernel 4.14 (TI SDK 5.0), with only minor changes to
> the ti-sgx-* libraries (support gbm_bo and GCC7).
> http://www.ti.com/tool/PROCESSOR-SDK-AM335X
> 
> kmscube seems to depend heavily on the mesa3d implementation, so I
> don't think it's easy to make it work with the other libgbm versions.
> Would building a working QT be a valid test of the libgbm build?

Yes, it would be. So what you're saying is that the libgbm
implementation provided by TI SGX mimics well enough the libgbm
implementation of Mesa3D that QT5 is happy with TI SGX libgbm
implementation ?

> Note that ti-sgx-um depends on wayland, due to a library dependency on
> libwayland-server.so.0 and libwayland-client.so.0  (see ldd libpvrs_WAYLAND.so)
> So the dropped dependency to wayland in ti-sgx-libgbm should have been
> on ti-sgx-um.
> Without it, QT5 will not find any EGL backend.
> 
> So the ti-sgx-um should be adding
> select BR2_PACKAGE_WAYLAND
> select BR2_PACKAGE_HAS_LIBEGL_WAYLAND

ACK.

> That way Qt5 can build with a valid EGL backend, using ti-sgx instead
> of the ancient ti-gfx.
> But this does nothing to help build kmscube.

Right. I'm still confused by this libgbm thing though, where everyone
seems to have its own implementation, but there is no common API
implemented by everybody.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
