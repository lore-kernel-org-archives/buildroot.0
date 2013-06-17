From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Jun 2013 19:54:07 +0200
Subject: [Buildroot] Changes in the Buildroot autobuilders
In-Reply-To: <CAEBucnCWYyj23_RyLtP3p-B6zmBYiYOA4LiODMEdxEr7x4D+xw@mail.gmail.com>
References: <20130616180054.58f52914@skate> <20130616170305.GI3495@free.fr>
 <20130616191806.7b4a899a@skate> <20130616172508.GL3495@free.fr>
 <20130616200540.5a370504@skate> <20130617074535.GB16699@lukather>
 <20130617094958.33eaff88@skate>
 <CAEBucnCWYyj23_RyLtP3p-B6zmBYiYOA4LiODMEdxEr7x4D+xw@mail.gmail.com>
Message-ID: <20130617175407.GA3202@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Spenser, All,

On 2013-06-17 11:20 -0500, Spenser Gilliland spake thusly:
> Are we sure we want to add more variables to the .mk files.  One of
> Buildroot's main differentiators is the cleanliness of these files in
> comparison to other packaging methods.
> 
> As an alternative, this information could be pulled from the git log
> and anyone who has made a change to the package directory in the past
> would be subscribed to errors.

No, I am not in favour of this solution.

Being a 'maintainer' should be voluntary, opt-in, and explicit.

If I send an update or fix to a package does not mean I am committed to
maintain that package in the long-run. This change can be just a typo or
something minor, and might not express my interest in the wellfare of
that package.

However, if I am really interested in a package (eg. those I've
submitted, or others that are important to me), then I want to express
this intent to maintain it explicitly.

Now, I understand that adding yet more to the .mk can be seen as clutter.

The alternative to a expressing maintainership in the source would be to
have the autobuilder website offer a way to subscribe/unsubscribe to
certain conditions (eg. package, arch...). I think this is a bit
overkill, and delicate to handle.

So, there are three possibilities:

  - per-package _MAINTAINER variable in each .mk
  - global MAINTAINERS a bit like the Linux kernel
  - subscription from the autobuilder website

My preference goes to the first, but I think the second is good too.
I'd expect the third to be complex and too overkill for this, unless
Thomas (which is responsible for the autobulders ;-) ) thinks he can
handle this, of course.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
