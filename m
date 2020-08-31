From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Aug 2020 23:49:15 +0200
Subject: [Buildroot] [PATCH] support/misc/gitlab-ci.yml.in: include
 Branches workflow
In-Reply-To: <2388ea60-a8cb-9685-b075-11b1a49be9ff@mind.be>
References: <20200830155953.1650346-1-arnout@mind.be>
 <20200831124350.GP14354@scaer>
 <2388ea60-a8cb-9685-b075-11b1a49be9ff@mind.be>
Message-ID: <20200831214915.GT14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Jugurtha, All,

On 2020-08-31 14:58 +0200, Arnout Vandecappelle spake thusly:
> On 31/08/2020 14:43, Yann E. MORIN wrote:
> > +Romain and +Jugurtha, as we've had some discussions on that topic
> > publicly and privately before.
[--SNIP--]
> > To that effect, I already started workign on that two weeks ago, and I
> > have omething that works as before (even better I think):
> >     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/gitlab-ci-cond
> > I just need to cleanup that last commit (and remember why I started
> > doing it. meh...). I hope I'll be able to send it tonight.

And of course, as usual, I did not have time to properly finish that
branch...

Still, it is very close to be ready, with all the test cases now working
as expected:

Random branch, only basic tests
    https://gitlab.com/ymorin/buildroot/-/commits/yem/gitlab-ci-cond
    https://gitlab.com/ymorin/buildroot/-/pipelines/184068345

All defconfigs:
    https://gitlab.com/ymorin/buildroot/-/commits/FOO-defconfigs
    https://gitlab.com/ymorin/buildroot/-/pipelines/184069188

One defconfig:
    https://gitlab.com/ymorin/buildroot/-/commits/FOO-warp7_defconfig
    https://gitlab.com/ymorin/buildroot/-/pipelines/184068523

All runtime tests:
    https://gitlab.com/ymorin/buildroot/-/commits/FOO-runtime-tests
    https://gitlab.com/ymorin/buildroot/-/pipelines/184070380

One runtime test:
    https://gitlab.com/ymorin/buildroot/-/commits/FOO-tests.package.test_openssh
    https://gitlab.com/ymorin/buildroot/-/pipelines/184068633

I still have to test a maintenance branch (by faking one with a branch
named 'fooo.no.x' to match the pattern), but I'm afraid I've reached my
allowed number of jobs for now...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
