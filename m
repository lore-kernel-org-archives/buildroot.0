From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jan 2014 22:28:32 +0100
Subject: [Buildroot] Why is sysroot under i686-buildroot-linux-gnu?
In-Reply-To: <CAJpxd07vs10v6uhOe3=_a=Rj-40x+Q8yWh0cK+YbTnP1HdzLTw@mail.gmail.com>
References: <CAJpxd07vs10v6uhOe3=_a=Rj-40x+Q8yWh0cK+YbTnP1HdzLTw@mail.gmail.com>
Message-ID: <20140104222832.7a8dab5b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bryce Schober,

On Fri, 3 Jan 2014 15:54:09 -0800, Bryce Schober wrote:
> I'm using a custom external toolchain built by crosstool-ng that's a
> fairly ordinary configuration, other than using an old gcc-4.3 and
> glibc-2.9, ending up with a i686-unknown-linux-gnu toolchain.
> 
> Why does buildroot end up installing the toolchain sysroot under
> output/host/usr/i686-buildroot-linux-gnu instead of under
> output/host/usr/i686-unknown-linux-gnu?

Just because we set the vendor part of the tuple to "Buildroot" to
distinguish the Buildroot compiler/sysroot from the one of the original
toolchain. There is no strong need for this, it's just a bit nicer.

> This is causing some problems in some of my external makefiles I have
> that expect the sysroot dir to match the toolchain tuple...

They do: in host/usr/bin/, you have a compiler whose tuple matches the
sysroot directory name.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
