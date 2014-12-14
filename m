From: Thierry Bultel <tbultel@free.fr>
Date: Sun, 14 Dec 2014 11:14:59 +0100
Subject: [Buildroot] dbus build fails since the bump of systemd to
	version 218
In-Reply-To: <87wq5vp6fa.fsf@dell.be.48ers.dk>
References: <548B6E4E.104@free.fr> <87wq5vp6fa.fsf@dell.be.48ers.dk>
Message-ID: <548D6323.3010102@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 13/12/2014 22:48, Peter Korsgaard a ?crit :
>>>>>> "Thierry" == Thierry Bultel <tbultel@free.fr> writes:
>
>   > Hi,
>   > Since the bump, there are undefined symbols when building dbus-1.8.10:
>
>   >  CCLD     dbus-daemon
>   >   CCLD     dbus-daemon-launch-helper
>   > /shared/buildroot_community/buildroot/output/host/usr/i586-buildroot-linux-gnu/sysroot/usr/lib/libsystemd.so:
>   > undefined reference to `__stop_BUS_ERROR_MAP'
>   > /shared/buildroot_community/buildroot/output/host/usr/i586-buildroot-linux-gnu/sysroot/usr/lib/libsystemd.so:
>   > undefined reference to `__start_BUS_ERROR_MAP'
>   > collect2: error: ld returned 1 exit status
>   > /shared/buildroot_community/buildroot/output/host/usr/i586-buildroot-linux-gnu/sysroot/usr/lib/libsystemd.so:
>   > undefined reference to `__stop_BUS_ERROR_MAP'
>   > /shared/buildroot_community/buildroot/output/host/usr/i586-buildroot-linux-gnu/sysroot/usr/lib/libsystemd.so:
>   > undefined reference to `__start_BUS_ERROR_MAP'
>   > collect2: error: ld returned 1 exit status
>
> What toolchain is this? According to upstream it is could be because of
> a binutils bug:
>
> https://www.marshut.net/kttspt/build-error-with-218-undefined-reference-to-start-bus-error-map.html
>


This happens with buildroot toolchain, eglibc 2.18, gcc-4.8.x, binutils 2.22

It does not happen with binutils-2.23.2 and binutils-2.24
