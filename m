From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 21:05:52 +0200
Subject: [Buildroot] [v5] package: add qt5virtualkeyboard
In-Reply-To: <20170329172902.wzhphoda4n4fu2wb@gportay>
References: <20170329155822.32245-1-gael.portay@savoirfairelinux.com>
 <20170329180311.533db852@free-electrons.com>
 <20170329172902.wzhphoda4n4fu2wb@gportay>
Message-ID: <20170329210552.59d207d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Mar 2017 13:29:02 -0400, Ga?l PORTAY wrote:

> I modified the Makefile so the LICENSE variable is set to (all layouts +
> handwriting):
> 
> "GPLv3, Apache-2.0 (openwnn), Apache-2.0 (pinyin), Apache-2.0 BSD-3c (tcime), MIT (lipi-toolkit)"
> 
> Is it correct?

It looks good. Note that I'm saying it looks good from a formatting
point of view: I haven't checked the actual licenses.

> I can also be more explicit:
> 
> "GPLv3, Apache-2.0 (openwnn/ja_JP), Apache-2.0 (pinyin/zh_TW), Apache-2.0 BSD-3c (tcime/zh_TW), MIT (lipi-toolkit/handwriting)"

This is probably a bit too verbose, what you proposed above as the
first solution looks sufficient to me.

> Thank you for your review. I did not understand why some packages have a comma
> in LICENSE while others have 'and/or' or are simply white-space separated.

The Buildroot manual normally explains what the formatting should be,
but it is very possible that some packages do not comply 100% with the
rules described in the manual (simply because those packages were added
before the rules were clarified in the manual).

Basically, the idea is that: a comma separates multiple licenses that
cover different parts of the package, with parenthesis to indicate what
component is covered by that license. The "or" statement is used when
the package is available under a choice of licenses (i.e you can chose
to use say the GPLv2 terms *OR* the MIT terms for the whole package,
for example).

> If you agree with those modifications, I will send a v6 of this patch
> (including missing prefix for QMAKEFLAGS).

The modifications look good to me. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
