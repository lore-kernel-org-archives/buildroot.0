From: Stefan Becker <chemobejk@gmail.com>
Date: Tue, 12 Jun 2018 21:07:35 +0300
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <1528825657.28705.168.camel@impinj.com>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com>
 <9ca7c9e9-061c-1dfb-f348-b92407b2f7e0@mind.be>
 <1528825657.28705.168.camel@impinj.com>
Message-ID: <CAOJ2eMd6vMsXRDSwNRBT1cK2S2i2kBhpqdMvkv9tqUoPTcYhrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Trent, All,

On Tue, Jun 12, 2018 at 8:47 PM Trent Piepho <tpiepho@impinj.com> wrote:
>

I didn't want to write anything to this thread at first, but then I
saw that what Trent wrote matches 100% what I was thinking when
looking at the change.

I'm very disappointed with the attitude displayed by the buildroot
developers in this thread. Trent has valid points and IMHO has made
sensible suggestions how to address those. But all I see from the
project developers is the typical knee-jerk reaction to SW build or SW
integration issues, i.e. "buildroot is always correct, your system is
doing it wrong".

Can we please all take a step backward and agree that there is a whole
universe outside buildroot with different (integration) requirements?
For the change under review I would suggest:

(A) there are existing users of the "sdk" target and this change would
modify its behaviour in an undesired/surprising fashion.

(B) instead this change should introduce e.g. the target
"sdk-tarball", which depends on "sdk" and generates the new tarball
format. It is then up to the users of "sdk" to decide if they can use
the new build artifact or not.

(C) having a build artefact that changes the name in every build is
bad for automatic build setups. So (B) must offer a way for automatic
build scripts to set the generated tarball name. If the user can use
the new tarball format in his integration, then he can switch from
"sdk" to "sdk-tarball" with the existing name (and possibly using
--strip-components in downstream build scripts).

Just my ?0.02...

       Stefan
