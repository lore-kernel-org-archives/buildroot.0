From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 11:43:07 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAFbHwiSvfDnHS1ovy2QTsA1t4-yJ_fwW+TwUhwK=N8z6T0-vYg@mail.gmail.com>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
 <CAFbHwiRbF9E=7st0wu+WesxSnWayQjjKWKuEb+n4QqvbNk21ww@mail.gmail.com>
 <20131111111718.0c539360@skate>
 <CAFbHwiSvfDnHS1ovy2QTsA1t4-yJ_fwW+TwUhwK=N8z6T0-vYg@mail.gmail.com>
Message-ID: <20131111114307.61ad4e63@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Newton,

On Mon, 11 Nov 2013 10:25:27 +0000, Will Newton wrote:

> Yes, Thumb-2. Only those crazy microcontroller guys care about Thumb-1. ;-)
> 
> ARM ARM A8.8.203 is the relevant page, Thumb-2 cannot store pc/r15
> directly. It should be possible to use a temporary to achieve the same
> effect but it would need thorough testing.

So I guess we need to disable valgrind on Thumb-2, or make it build
with ARM instructions even on Thumb-2 builds. Or bump Valgrind and see
if the new version is fixed for Thumb-2.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
