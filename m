From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Apr 2012 12:03:23 +0200
Subject: [Buildroot] Samba breakage on arm
In-Reply-To: <4F9118BB.2010300@free-electrons.com> (Maxime Ripard's message of
 "Fri, 20 Apr 2012 10:05:15 +0200")
References: <4F9118BB.2010300@free-electrons.com>
Message-ID: <87r4viiutw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Hi,

 Maxime> Just for the heads up, as I am not sure we can do anything
 Maxime> about it or I don't know a proper way to fix this.

 Maxime> Building samba with any CodeSourcery/Codebench toolchains except the
 Maxime> 2011.09 will trigger either a compiler segfault or an internal compiler
 Maxime> error.

 Maxime> This is for every case. Just enabling samba will break.

 Maxime> This means that in the latest release, you cannot build samba at least
 Maxime> with these toolchains.

 Maxime> I've not tested with ct-ng or internal toolchains however, so
 Maxime> maybe it's not that bad...

It built with the internal toolchain on gcc10 recently without problems:

http://autobuild.buildroot.org/results/ce801288dbf24fc394116636d0562effc6b4eace/defconfig

That's pretty much the problem with these binary toolchains. There's not
much we can do about this compiler bug (besides removing the older
versions)

-- 
Bye, Peter Korsgaard
