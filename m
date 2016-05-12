From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 23:45:48 +0200
Subject: [Buildroot] SDL2_ttf requires libpng12 but Buildroot installs
 libpng16
In-Reply-To: <CAGrGpJB1XFuZWdXS7rWeaA9E7N2yzde8JuSp_A8KjU2vD6h_VA@mail.gmail.com>
References: <CAGrGpJB1XFuZWdXS7rWeaA9E7N2yzde8JuSp_A8KjU2vD6h_VA@mail.gmail.com>
Message-ID: <20160512234548.20d6cd28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 13:05:56 -0600, Peter Thompson wrote:

> Below are my personal notes on how I compiled the SDL2 suite  -   in the
> hopes it is helpful to someone else.   pmtstaging is a copy of the
> buildroot sysroot which I wanted to keep pristine during this process.
> 
> I will try to convert these  notes into a buildroot patch and submit it -
> making life much easier in the future.

Quick question that might sound silly, but I believe worth asking: why
are you taking this terribly complicated path to build SDL2_ttf
manually, rather than creating a Buildroot package directly?

The Buildroot autotools package infrastructure already handles most of
the cross-compilation problems by itself. So all this terrible dance of
CFLAGS and LDFLAGS, copying of sysroot and stuff that you're doing
would have been completely unneeded if you had done a Buildroot package
from the beginning.

It seems to me like you've wasted a huge amount of time :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
