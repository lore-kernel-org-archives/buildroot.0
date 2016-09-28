From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Sep 2016 10:59:00 +0200
Subject: [Buildroot] pppd breaks build without libutils
In-Reply-To: <20160927214325.GC8646@free.fr>
References: <CAOoxthNVzy2PCz1tsACpxdhaoVO=RZgQR-A1dMB2u0HA3yXPqA@mail.gmail.com>
 <20160925205851.18f334ec@free-electrons.com>
 <CAOoxthNdJjSjiLS7PT_SguV7VSWxHrF8UiK0qtPz+D3bDEpnUA@mail.gmail.com>
 <5cce18a6-b051-a6bf-17e0-e9fa82a1491e@mind.be>
 <20160927214325.GC8646@free.fr>
Message-ID: <20160928105900.55310907@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Sep 2016 23:43:25 +0200, Yann E. MORIN wrote:

> Which suddenly rings a bell here: the latest uClibc-ng version, 1.0.18,
> now is one-lib, i.e. everything merged into libc.so like musl is, so
> we could get external toolchains which will lack libutil.so because
> there is no longer such a library now.
> 
> If uClibc-ng does like musl does, there will be a lot of empty static
> versions of the libraries, libutil.a, libcrypt.a and so on, but there
> will no longer be shared variants.
> 
> We'll have to account for that in our external toolchain handling.

I'm not sure what needs to be handled. We already support musl that
does this, and it works fine. It should be perfectly transparent to the
external toolchain handling (except the copying of the shared libraries
to the target, of course).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
