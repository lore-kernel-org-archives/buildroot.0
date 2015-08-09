From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 9 Aug 2015 14:44:55 +0200
Subject: [Buildroot] [PATCH] python-pyroute2: new package
In-Reply-To: <20150809115927.534283e9@free-electrons.com>
References: <1438942181-30466-1-git-send-email-yegorslists@googlemail.com>
 <20150809115927.534283e9@free-electrons.com>
Message-ID: <CAGm1_ktTRNcXL6iTunk+8kUEfYC=ABC=S+7pE0JuCit8GmRDLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 9, 2015 at 11:59 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Yegor,
>
> On Fri,  7 Aug 2015 12:09:41 +0200, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/Config.in                          |  1 +
>>  package/python-pyroute2/Config.in          |  7 +++++++
>>  package/python-pyroute2/python-pyroute2.mk | 20 ++++++++++++++++++++
>>  3 files changed, 28 insertions(+)
>>  create mode 100644 package/python-pyroute2/Config.in
>>  create mode 100644 package/python-pyroute2/python-pyroute2.mk
>
> This doesn't build here with Python 3, due to an encoding issue:
>
>>>> python-pyroute2 0.3.8 Building
> (cd /home/thomas/projets/buildroot/output/build/python-pyroute2-0.3.8//; PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/projets/buildroot/output/host/usr/bin:/home/thomas/projets/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/thomas/sys/bin" CC="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os " LDFLAGS="" LDSHARED="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc -shared" PYTHONPATH="/home/thomas/projets/buildroot/output/target/usr/lib/python3.4/sysconfigdata/:/home/thomas/projets/buildroot/output/target/usr/lib/python3.4/site-packages/" _python_sysroot=/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot _python_prefix=/usr _python_exec_prefix=/usr  /home/thomas/projets/buildroot/output/host/u
>  sr/bin/python setup.py build --executable=/usr/bin/python )
> Traceback (most recent call last):
>   File "setup.py", line 76, in <module>
>     long_description=readme.read())
>   File "/home/thomas/projets/buildroot/output/host/usr/lib/python3.4/encodings/ascii.py", line 26, in decode
>     return codecs.ascii_decode(input, self.errors)[0]
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 375: ordinal not in range(128)
> package/pkg-generic.mk:156: recipe for target '/home/thomas/projets/buildroot/output/build/python-pyroute2-0.3.8/.stamp_built' failed
>
> You can reproduce using the following defconfig:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.05-1190-g4a48479.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON_PYROUTE2=y
> # BR2_TARGET_ROOTFS_TAR is not set

I have no problem with this defconfig. Strange. Have English Xubuntu 15.04.

Yegor
