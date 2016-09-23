From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 23 Sep 2016 09:11:16 +0200
Subject: [Buildroot] Error building python packages that uses setuptools
In-Reply-To: <CAN0YATNWhj5NmSQa_gSUNqQhgrNh0sGq_MR-ABn0d25MyH=HWA@mail.gmail.com>
References: <1474609104846-145834.post@n4.nabble.com>
 <CAGm1_ktPCc04+w0Z2y_c4uWvUodx3+t7+pSH3S0H5Uo0KALsZw@mail.gmail.com>
 <CAN0YATNWhj5NmSQa_gSUNqQhgrNh0sGq_MR-ABn0d25MyH=HWA@mail.gmail.com>
Message-ID: <CAGm1_kvCC+0zLQUmnWP69sYcoBEyFh459rBGAJM_KKMWQux6WQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm on Debian 9 too. Here is my defconfig, that is working:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PYMYSQL=y

On Fri, Sep 23, 2016 at 9:01 AM, Fabi?n Inostroza
<soulsonceonfire@gmail.com> wrote:
> It was a version cloned about 2 hours ago (commit id ba16a7a...), just to
> try pulled the new commits with no results
> Yes, while trying to fix the build I  ran 'make clean' several times.
>
> PD: I'm running Debian testing
>
> El viernes, 23 de septiembre de 2016, Yegor Yefremov
> <yegorslists@googlemail.com> escribi?:
>>
>> Hi,
>>
>> On Fri, Sep 23, 2016 at 7:38 AM, totoxa <soulsonceonfire@gmail.com> wrote:
>> > Hi,
>> >
>> > I'm trying to build python-serial and python-pymysql, both of them use
>> > setuptools to install.
>> > After running make the build fails with the following error:
>> >
>> >>>> python-pymysql 0.7.2 Installing to target
>> > (cd /home/dev/buildroot/output/build/python-pymysql-0.7.2//;
>> >
>> > PATH="/home/dev/buildroot/output/host/bin:/home/dev/buildroot/output/host/sbin:/home/dev/buildroot/output/host/usr/bin:/home/dev/buildroot/output/host/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
>> >
>> > PYTHONPATH="/home/dev/buildroot/output/target/usr/lib/python2.7/sysconfigdata/:/home/dev/buildroot/output/target/usr/lib/python2.7/site-packages/"
>> >
>> > _python_sysroot=/home/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot
>> > _python_prefix=/usr _python_exec_prefix=/usr
>> > /home/dev/buildroot/output/host/usr/bin/python setup.py install
>> > --no-compile
>> > --prefix=/home/dev/buildroot/output/target/usr
>> > --executable=/usr/bin/python
>> > --single-version-externally-managed --root=/ )
>> > usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
>> >    or: setup.py --help [cmd1 cmd2 ...]
>> >    or: setup.py --help-commands
>> >    or: setup.py cmd --help
>> >
>> > error: option --executable not recognized
>> > package/pkg-generic.mk:282: fallo en las instrucciones para el objetivo
>> >
>> > '/home/dev/buildroot/output/build/python-pymysql-0.7.2/.stamp_target_installed'
>> > make: ***
>> >
>> > [/home/dev/buildroot/output/build/python-pymysql-0.7.2/.stamp_target_installed]
>> > Error 1
>> >
>> >
>> > I searched for the files related to setuptools installation and none of
>> > the
>> > path containing those files are passed as arguments
>> > to the packages failing to build.
>> > I think that either the host-python-setup installation went wrong or
>> > that
>> > the arguments used for the built are wrong.
>> > I'm no expert in buildroot, so I ask for help.
>> >
>> > $ find output/ -name 'install_scripts.*'
>> >
>> > output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/python2.7/distutils/command/install_scripts.py
>> > output/host/usr/lib/python2.7/distutils/command/install_scripts.py
>> > output/host/usr/lib/python2.7/distutils/command/install_scripts.pyc
>> > output/build/host-python-2.7.12/Lib/distutils/command/install_scripts.py
>> >
>> > output/build/host-python-2.7.12/Lib/distutils/command/install_scripts.pyc
>> >
>> > *output/build/host-python-setuptools-18.7.1/setuptools/command/install_scripts.py
>> >
>> > output/build/host-python-setuptools-18.7.1/setuptools/command/install_scripts.pyc
>> >
>> > output/build/host-python-setuptools-18.7.1/build/lib/setuptools/command/install_scripts.py*
>> > output/build/python-2.7.12/Lib/distutils/command/install_scripts.py
>> > output/build/python-2.7.12/Lib/distutils/command/install_scripts.pyc
>> > output/target/usr/lib/python2.7/distutils/command/install_scripts.py
>>
>> Have you already tried:
>>
>> make clean && make
>>
>> What BR version are you using?
>>
>> Yegor
