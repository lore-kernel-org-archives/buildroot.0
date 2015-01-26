From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 12:21:41 +0100
Subject: [Buildroot] [PATCH 1/2] qwt: compile as a static lib if
 QT_SHARED is not selected
In-Reply-To: <54C60A2A.9090805@gmail.com>
References: <1421749049-1431-1-git-send-email-richard.genoud@gmail.com>
 <20150120174507.1d11ab61@free-electrons.com>
 <87siey4i48.fsf@dell.be.48ers.dk> <54C60A2A.9090805@gmail.com>
Message-ID: <20150126122141.437dd519@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Genoud,

On Mon, 26 Jan 2015 10:34:34 +0100, Richard Genoud wrote:

> > I agree that it would be cleaner, but the reason the explicit QT_SHARED
> > stuff was added was afaik a lot of systems only needed Qt in a single
> > application / that application only used a subset of the Qt
> > functionality, so having a static libQt while everything else was shared
> > was quite a big win in size / startup time.
> 
> yes, that's exactly my case. I've got one single Qt application, and Qt
> is quite huge, so making it static saves a lot of space.
> I didn't trying to compile with BR2_STATIC_LIBS=y, but I guess that my
> rootfs will be much bigger.

Probably. Unfortunately with kconfig, we cannot easily add one option
for debug symbols, static/dynamic linking to each package. It would add
gazillions of options.

One possibility would be to have one global string option that you
could fill in with a space-separated list of packages that you want to
be built statically, even if the rest of the system is built
dynamically.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
