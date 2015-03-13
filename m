From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 13 Mar 2015 18:22:23 +0100
Subject: [Buildroot] trying to add python-smbus-cffi,
	but installing fails
In-Reply-To: <5503198F.6070804@vu.nl>
References: <5503198F.6070804@vu.nl>
Message-ID: <CAGm1_kuM-ZPCdjcSpd_wK-20WZ2+hYOro2DjRZ3dNibTsbLHPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 13, 2015 at 6:08 PM, ir. Tjeerd Pinkert <t.j.pinkert@vu.nl> wrote:
> Hi,
>
> I was trying to install the python smbus-cffi as a package (currently in my
> BR2_EXTERNAL directory) but installation fails.
>
> It looks like the package is trying to load itself to register, but of
> course it fails because I think the host python loads this, and can not load
> the _cffi_backend.so compiled for the target?
>
> Anyone an idea how to get solve this chicken egg problem?
>
> This is the part where the install script fails:
> Installed
> /local/opt/freescale/buildroot/output/build/python-smbus-cffi-0.4.1/pycparser-2.10-py2.7.egg
> Traceback (most recent call last):
>   File "setup.py", line 7, in <module>
>     import smbus
>   File
> "/local/opt/freescale/buildroot/output/build/python-smbus-cffi-0.4.1/smbus/__init__.py",
> line 1, in <module>
>     from .smbus import ffi
>   File
> "/local/opt/freescale/buildroot/output/build/python-smbus-cffi-0.4.1/smbus/smbus.py",
> line 40, in <module>
>     ffi = FFI()
>   File
> "/opt/freescale/buildroot/output/target/usr/lib/python2.7/site-packages/cffi/api.py",
> line 56, in __init__
>     import _cffi_backend as backend
> ImportError:
> /opt/freescale/buildroot/output/target/usr/lib/python2.7/site-packages/_cffi_backend.so:
> wrong ELF class: ELFCLASS32
> make: ***
> [/opt/freescale/buildroot/output/build/python-smbus-cffi-0.4.1/.stamp_built]
> Error 1
>
> I include here the Buildroot scripts for installation, which should make it
> easy to test for others. (I think the PYTHON_SMBUS_CFFI_INSTALL_TARGET_OPTS
> = install is not needed, but it also fails without this)

Looks like the problem with python-cryptography:
https://github.com/pyca/cryptography/issues/1325 See the last post.
