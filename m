From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Jun 2013 01:12:30 +0200
Subject: [Buildroot] [RFC] ti-gfx: add new package
In-Reply-To: <CALo-6+jW937J=BmkEpDPe65LCrXUaKUeyWrNestbi2dHmciq-g@mail.gmail.com>
References: <CALo-6+j77P2RsdYRO9BR04rUX-j0HmxzXtBuHzo_UQ1wDjXbHQ@mail.gmail.com>
 <1370636307-23089-1-git-send-email-spenser@gillilanding.com>
 <CALo-6+ihs6caa98RCvZmZKZ5pUsfXjXPPBJn_zG4J6eBBpsuAw@mail.gmail.com>
 <CAEBucnC-HdSyDttBo4te_=eOR259ebSAwWQuE_W3zcyLVjwSQA@mail.gmail.com>
 <EE4E4767751A8B40949306E403F4DDD802EEB1D7@sv03ultra002.ultratronik.de>
 <CALo-6+jEOu+5pTr2oizokQexOdm1EimxYhM-Q1sHEnJ_oBFMog@mail.gmail.com>
 <20130614222254.56e49fcb@skate>
 <CALo-6+jW937J=BmkEpDPe65LCrXUaKUeyWrNestbi2dHmciq-g@mail.gmail.com>
Message-ID: <20130614231230.GB3417@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, All,

On 2013-06-14 13:58 -0700, Charles Krinke spake thusly:
> Behind my comments is the issue of TI's practices and I hope we dont
> make it worse by tweaking buildroot in an unusual direction, but I
> will, as usual, follow your lead.

Hmm. I guess we *do* want to hear opinions like yours. That's what in
the end shapes what Buildroot is, and where it goes.

Then, any enhancement should be done in a way that follows the Buildroot
"philosophy" (which is rather not-so-well defined, although the great
lines revolves around KISS, basically, and easiness for the user).

> My perspective is from working with the TI AM3517_evm for the last
> year.

Getting input from people that have experience on the topic is very good
to have. Thank you! :-)

> One of the issues is the fact that TI supplies their kernel
> source out-of-tree as a distribution release. As a consequence no one
> cannot expect kernel.org kernels to work properly for at least this
> reference design.

There has never been such expectation expressed.

Also, we already have some defconfig for some boards where the kernel is
not retrieved from k.org, but from a third-party. For example, the
RaspberryPi defconfig points to the github clone/fork that has RPi
support, and not to k.org.

I can't see a reason not to provide such a defconfig for other boards.

Unless it is no possible to easily retrieve the kernel from that TI
packaging /mess/.

> That is, the TI kernel modifications never made it
> into the mainline kernel, so we have a non-kernel.org situation to
> start with. This should cause buildroot to tread carefully unless we
> also get the patches from TI that change a standard kernel into a
> TI-special kernel.

There is no way Buildroot carries such patches, indeed. Either the user
starts up with the defconfig, or is versed enough to point Buildroot to
use a TI-ready kernel.

> On the Graphics_SDK, since this is a product that TI releases along
> with their kernel from time-to-time. Since this is also not an
> opensource project, I have some angst with patching the released
> Graphics_SDK. This doesnt make any sense to me since this product
> along with the kernel are releases from TI.

Buildroot has a very good infrastructure for declaring licensing
information per-package, and preparing a manifest of such licensing
terms for the user to *review* (and not trust blindly), and decide
whether the licenses combination is valid for him, in his jurisdiction,
for his use-case, and so on...

The Graphics_SDK will *not* be bundled in Buildroot; it's only the user's
actions that will trigger a download/build/install of the Graphics_SDK
source code and binary blobs to his rootfs.

> So, I guess the key issue is mixing distribution releases from a
> vendor with traditional, well-known opensource projects and how
> buildroot can best move forward.

Licensing infrastrucuture, my friend! :-)

    make legal-info

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
