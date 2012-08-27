From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Mon, 27 Aug 2012 20:34:10 +0200
Subject: [Buildroot] Buildproblems while running make
In-Reply-To: <5037EBDC.4020205@googlemail.com>
References: <5037EBDC.4020205@googlemail.com>
Message-ID: <503BBDA2.2030405@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

after some days and new trys it works.
I think that something (old) in the output/ directory has produced this
behavior.
After a start from scratch and recopy my configs buildroot just works
fine! Now I have to do more finetuning.

Thanks for this shiny FOSS!

Regards
Carsten

Am 24.08.2012 23:02, schrieb Carsten Schoenert:
> Hello,
> 
> I'm successful setting up BR for building a ARM cross compiler with
> CT-NG. Now I've added a project specific kernelconfig for 2.6.39.4 and
> started a build process.
> 
> The whole cross compiler part is working without problems, so after this
> some tools should be builded. But the build failed with an error message
> about aclocal could not be found.
> This confuses me a little bit, because some lines above is to see that
> automake1.11 was successful builded. Here is the relevant output.
>> make[3]: F?r das Ziel ?install-exec-am? ist nichts zu tun.
>>  /bin/mkdir -p '/home/carsten/gitprojects/buildroot/output/target/usr/share/aclocal-1.11'
>>  /usr/bin/install -c -m 644 ../m4/amversion.m4 ar-lib.m4 as.m4 auxdir.m4 ccstdc.m4 cond.m4 cond-if.m4 depend.m4 depout.m4 dmalloc.m4 gcj.m4 header.m4 init.m4 install-sh.m4 lead-dot.m4 lex.m4 lispdir.m4 maintainer.m4 make.m4 minuso.m4 missing.m4 mkdirp.m4 multi.m4 obsol-gt.m4 obsol-lt.m4 obsolete.m4 options.m4 protos.m4 python.m4 regex.m4 runlog.m4 sanity.m4 silent.m4 strip.m4 substnot.m4 tar.m4 upc.m4 vala.m4 '/home/carsten/gitprojects/buildroot/output/target/usr/share/aclocal-1.11'
>> make[3]: Leaving directory `/home/carsten/gitprojects/buildroot/output/build/automake-1.11.5/m4'
>> make[2]: Leaving directory `/home/carsten/gitprojects/buildroot/output/build/automake-1.11.5/m4'
>> Making install in tests
>> make[2]: Entering directory `/home/carsten/gitprojects/buildroot/output/build/automake-1.11.5/tests'
>> make[3]: Entering directory `/home/carsten/gitprojects/buildroot/output/build/automake-1.11.5/tests'
>> make[3]: F?r das Ziel ?install-exec-am? ist nichts zu tun.
>> make[3]: F?r das Ziel ?install-data-am? ist nichts zu tun.
>> make[3]: Leaving directory `/home/carsten/gitprojects/buildroot/output/build/automake-1.11.5/tests'
>> make[2]: Leaving directory `/home/carsten/gitprojects/buildroot/output/build/automake-1.11.5/tests'
>> make[1]: Leaving directory `/home/carsten/gitprojects/buildroot/output/build/automake-1.11.5'
>> mkdir -p /home/carsten/gitprojects/buildroot/output/target/etc
>> echo "buildroot" > /home/carsten/gitprojects/buildroot/output/target/etc/hostname
>> /bin/sed -i -e '$a \127.0.1.1\tbuildroot' \
>> 		-e '/^127.0.1.1/d' /home/carsten/gitprojects/buildroot/output/target/etc/hosts
>> mkdir -p /home/carsten/gitprojects/buildroot/output/target/etc
>> echo "Welcome to Buildroot" > /home/carsten/gitprojects/buildroot/output/target/etc/issue
>> /bin/sed -i -e '/# GENERIC_SERIAL$/s~^.*#~ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 #~' \
>> 		/home/carsten/gitprojects/buildroot/output/target/etc/inittab
>> /bin/sed -i -e '/^#.*# REMOUNT_ROOTFS_RW$/s~^#\+~~' /home/carsten/gitprojects/buildroot/output/target/etc/inittab
>>>>> host-module-init-tools 3.15 Autoreconfiguring
>> aclocal: couldn't open directory '/home/carsten/gitprojects/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/share/aclocal': Datei oder Verzeichnis nicht gefunden
>> autoreconf: /home/carsten/gitprojects/buildroot/output/host/usr/bin/aclocal failed with exit status: 1
>> make: *** [/home/carsten/gitprojects/buildroot/output/build/host-module-init-tools-3.15/.stamp_configured] Fehler 1
> 
> Did I something misconfigured or misunderstood?
> Can someone point me to the correct direction? If there some config
> files needed just let me know.
> 
> And one more question, if I rerun make (without changes to BR) the
> complete cross compiler will be rebuilded, why this happen?
> 
> Thanks in advice,
> Carsten
