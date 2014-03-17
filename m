From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 17 Mar 2014 13:24:24 +0100
Subject: [Buildroot] Error building Qt5Multimedia
In-Reply-To: <53269705.6060805@gmail.com>
References: <53269705.6060805@gmail.com>
Message-ID: <CAAXf6LVoTKqC61B2fPbwp-9LQZ1ephfpEodHVfqedB7SPyn7kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marco,

On Mon, Mar 17, 2014 at 7:32 AM, Marco Trapanese
<marcotrapanese@gmail.com> wrote:
> Hello,
> I ran into another error building Qt5:
>
> cp: impossibile eseguire stat di
> "/home/marco/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libqgsttools*.so.*":
> File o directory non esistente
>
> It says it doesn't find libqgsttools*.so.*, I searched in the nconfig (using
> F8) and using find -name in the package directory without chance.
>
> Which package is required?
>

I created a build with your .config file, and did not have any error.
libqgsttools is present in qt5multimedia itself:

output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.so.1.0.0
output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.so.1.0
output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.so.1
output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.so
output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.prl

Did you do something special in your buildroot directory/repo ?
Try starting from a clean environment:
make clean all

Best regards,
Thomas
