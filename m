From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 19 Jan 2018 21:18:12 +0100
Subject: [Buildroot] Build Issue with Python-Pyopenssl
In-Reply-To: <CO1PR01MB160784195A9CC17DDDF1FA3B0EF0@CO1PR01MB160.prod.exchangelabs.com>
References: <CO1PR01MB160784195A9CC17DDDF1FA3B0EF0@CO1PR01MB160.prod.exchangelabs.com>
Message-ID: <CAGm1_ksUCnY=2YeYando7JEUKUfbM3ApWZEr9QYhoo4M3XxD-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 19, 2018 at 8:17 PM, Tahir Dawson <tahir@swiftlabs.com> wrote:
> Hello,
>
>
> I have been trying to add the python-pyopenssl package to my build. However,
> make fails when this package is added with the following output to the
> console:
>
>
>>>> python-pyopenssl 17.0.0 Building
>
> (cd /home/tahir/swiftcore/buildroot/build/build/python-pyopenssl-17.0.0//;
> _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata_m_linux_arm-linux-gnueabihf"
> PATH="/home/tahir/swiftcore/buildroot/build/host/bin:/home/tahir/swiftcore/buildroot/build/host/sbin:/home/tahir/bin:/home/tahir/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> PYTHONPATH="/home/tahir/swiftcore/buildroot/build/target/usr/lib/python2.7/sysconfigdata/"
> PYTHONNOUSERSITE=1
> _python_sysroot=/home/tahir/swiftcore/buildroot/build/host/arm-buildroot-linux-uclibcgnueabihf/sysroot
> _python_prefix=/usr _python_exec_prefix=/usr
> /home/tahir/swiftcore/buildroot/build/host/bin/python setup.py build  )
> Traceback (most recent call last):
>   File "setup.py", line 15, in <module>
>     from setuptools import setup, find_packages
> ModuleNotFoundError: No module named 'setuptools'
> package/pkg-generic.mk:247: recipe for target
> '/home/tahir/swiftcore/buildroot/build/build/python-pyopenssl-17.0.0/.stamp_built'
> failed
> make[1]: ***
> [/home/tahir/swiftcore/buildroot/build/build/python-pyopenssl-17.0.0/.stamp_built]
> Error 1
> Makefile:16: recipe for target '_all' failed
> make: *** [_all] Error 2
>
> Seems like the setuptools package is not found but this issue only occurs
> when trying to add python-pyopenssl and with no other python package. Any
> help with this problem will be much appreciated.

Perform a full rebuild "make clean && make" and let us know, if the
issue still persists.

Yegor
