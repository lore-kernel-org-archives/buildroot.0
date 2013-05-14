From: john <john.osullivan@cloudiumsystems.com>
Date: Tue, 14 May 2013 10:08:04 +0100
Subject: [Buildroot] Using Buildroot tool chain as external Toolchain
Message-ID: <1368522484.2434.45.camel@john-ubu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have been following various archived mails on this issue in an effort
to get this working. The most useful was
http://buildroot-busybox.2317881.n4.nabble.com/Can-I-use-the-toolchain-build-with-buildroot-as-an-external-toolchain-td26855.html

I followed this process:
1. I downloaded a copy of buildroot-2012.05
2. Configured it and built it for my system
3. Confirmed that everything built and ran sucessfully
4. Copied the contents of buildroot-2012.05/output/host/usr
to /apps/buildroot_toolchain/usr
5. In toolchain->options I set type to external toolchain
6. Selected toolchain-> custom toolchain
7. Set Toolchain path to /apps/buildroot_toolchain/usr
8. Set prefix to $(ARCH)-unknown-linux-uclibcgnueabi
9. Ensured that the options largefile support,RPC,WCHAR etc all matched
my previous settings when building the original toolchain
10. Saved my config and ran make clean 

But after following this process I have a problem, after doing a make
clean I get:


checking whether build environment is sane... yes
checking for
arm-linux-strip... /home/xxx/xxx/xxx/buildroot-2012.05/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-strip
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for
arm-linux-gcc... /home/xxx/xxx/xxx/buildroot-2012.05/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
checking whether the C compiler works... no
configure: error: in
`/home/xxx/xxx/xxx/buildroot-2012.05/output/build/alsa-lib-1.0.25':
configure: error: C compiler cannot create executables
See `config.log' for more details
make: ***
[/home/xxx/xxx/xxx/buildroot-2012.05/output/build/alsa-lib-1.0.25/.stamp_configured]
Error 77

Should the above process work? Is it a possible permissions issue, I
have tried changing the permissions on /apps/buildroot_toolchain/usr but
to no avail.
In the link I posted above Thomas has suggested that the tool chain
location be initially configured for In Build options, set the host dir
to /opt/your-toolchain-name etc
Is this necessary to make this work or should the process I use also
work?
