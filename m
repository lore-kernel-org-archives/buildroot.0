From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 19 Jul 2010 22:48:59 +0200
Subject: [Buildroot] [PATCH 5/5] toolchain: rename base target for
	external toolchains
In-Reply-To: <AANLkTimlLPyUd1RuH0ReU45-4m_r7CANO8Rk7ERht22W@mail.gmail.com>
References: <1278967576-11399-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1278967576-11399-6-git-send-email-yann.morin.1998@anciens.enib.fr>
	<AANLkTimlLPyUd1RuH0ReU45-4m_r7CANO8Rk7ERht22W@mail.gmail.com>
Message-ID: <201007192249.00218.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mitch, All,

On Monday 19 July 2010 03:50:54 Mitch Davis wrote:
> On Tue, Jul 13, 2010 at 6:46 AM, Yann E. MORIN
> <yann.morin.1998@anciens.enib.fr> wrote:
> > It is misleeading to name the external toolchain make target 'uclibc', as
> > external toolchains can be based on other C libraries (eg. glibc or eglibc).

> I understand your point about uclibc not being a suitable generic
> name, but I'm not sure toolchain-prepare is the ideal name.  To me,
> what this target does is guarantees the presence of the C run time
> library (whether that be uClibc, glibc, etc).  Might "c-rtl" or
> similar be a better name?  (Of course, in order to generate the RTL,
> the toolchain will need to be there, as usual).

OK, I agree that we can drop this patch for now, and do the rename later.
"c-rtl" is not that descriptive either... Even in-contect, it took me a
while to see what it meant...

Maybe smthg like:
fill-me-that-fscking-staging-and-target-with-the-fscking-runtime-from-toolchain-and-dont-forget-headers-and-statics-for-staging-please-oh-and-build-the-toolchain-if-needed-while-youre-at-it-if-you-dont-care-you-are-such-a-lovely-pet

Hehe! Yes, I like that one! :-)

[ Thomas, I bet you, this time! :) ]

> I can also imagine a scenario where one is building such a minimal
> system that one needs the toolchain, but not the RTL.  What are good
> target names to guarantee the toolchain, and the RTL, as separate
> targets?

Well, it will require some thinking...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
