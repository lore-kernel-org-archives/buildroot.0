From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Feb 2018 14:13:32 +0100
Subject: [Buildroot] glibc : cannot compute suffix of object files:
 cannot compile
In-Reply-To: <1519696992821-0.post@n4.nabble.com>
References: <1519696992821-0.post@n4.nabble.com>
Message-ID: <20180227141332.08113b98@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julia,

On Mon, 26 Feb 2018 19:03:12 -0700 (MST), Julia Ding <dingtasiling@gmail.com> wrote:

> I'm using i.Mx6Q and I need QT5 + OpenGL. So I just change C library to glibc
> in 'imx6-sabresd_qt5_defconfig'
> When I try to make it, it shows this error
> 
> configure: error: cannot compute suffix of object files: cannot compile
> See `config.log' for more details
> package/pkg-generic.mk:237: recipe for target
> '/buildroot/output/build/glibc-glibc-2.26-146-gd300041c533a3d837c9f37a099bcc95466860e98/.stamp_configured'
> failed
> make[1]: ***
> [/buildroot/output/build/glibc-glibc-2.26-146-gd300041c533a3d837c9f37a099bcc95466860e98/.stamp_configured]
> Error 1
> 
> My GCC compiler version is 6.X.
> 
> How to fix this? Thanks.

	$ make clean
	$ make

As stated in [1] 'Cleaning: Explicit cleaning is required when any of the architecture
or toolchain configuration options are changed.'...

Regards,
Peter

[1] http://nightly.buildroot.org/manual.html#make-tips

> 
> 
> 
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
