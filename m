From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Mar 2018 21:35:52 +0200
Subject: [Buildroot] [PATCH v2 2/3] test-pkg: test a subset of
 toolchains by default, add -a and -n options
In-Reply-To: <20180325210622.31817922@windsurf>
References: <20180323214815.19831-1-thomas.petazzoni@bootlin.com>
 <20180323214815.19831-3-thomas.petazzoni@bootlin.com>
 <20180325085018.GH2620@scaer> <20180325210622.31817922@windsurf>
Message-ID: <20180325193552.GO2620@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-03-25 21:06 +0200, Thomas Petazzoni spake thusly:
> On Sun, 25 Mar 2018 10:50:18 +0200, Yann E. MORIN wrote:
> > > Note that the list of toolchains (built in the "toolchains" shell
> > > variable) is no longer sorted. Indeed, when the first N toolchains are
> > > tested, we want them to be tested in the same order as they are listed
> > > in the CSV file, as we are careful to order them in an interesting
> > > order. We only sort when all toolchains are tested.  
> > 
> > I don't understand why you want to test them in the order they are
> > listed... I understand that you want them to be _selected_ in the order
> > they appear, yes. But tested? See below...
> 
> Well, the first 7 toolchains are kind of listed in the order of
> importance, so it makes more sense to *test* the most important
> toolchain first, so if it fails, you can abort there, investigate, and
> then restart the test.

Well, usually I would expect people to fire-and-forget the build, and
check later what is going on. This is not typically something you gaze
at while it is running...

Maybe we should be using that time to plot a Julia like the cool kids?  ;-]

> But that's not a strong opinion, so if you disagree with this, I don't
> care that much if the toolchains are tested in alphabetic ordering.

Well, as I said, not a big deal for me either.

I just like that things are consistent, and that, to the user, it looks
nicer to have something that is always sorted, because it is "nice".

With a very personal definition of "nice", that is! ;-]

So, go ahead: if there is no other feedback that requires a respin, just
apply it as-is.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
