From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 21:43:27 +0100
Subject: [Buildroot] [PATCH v3 1/2] randconfig,
 allyesconfig: fix handling of legacy options
In-Reply-To: <54AEEA65.1040501@mind.be>
References: <1413278695-8979-1-git-send-email-arnout@mind.be>
 <20141030230310.4b91e6ab@free-electrons.com>
 <20141231151734.0c95b119@free-electrons.com>
 <54AEEA65.1040501@mind.be>
Message-ID: <20150108214327.415ff023@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 08 Jan 2015 21:36:53 +0100, Arnout Vandecappelle wrote:

> >> I admit it's not really an issue introduced by the patch as the issue
> >> already exists for randpackageconfig. But it's very annoying :/
> > 
> > Any comment about this?
> 
>  Well, as you explained to me in Dusseldorf, the main reason to use randconfig
> is to test against buggy Config.in depends/select chains. If the choices
> wouldn't get properly randomized anymore, that would really kill this use case.
> So I guess that's a no go.

Well, the other day, I actually attempted to use randconfig to really
have random configurations, and see how broken they are. But randconfig
is unusable today, since it selects a bunch of legacy options, which
prevents the build from starting.

I'm not sure I actually use randconfig to test buggy Config.in
depends/select. I actually tend to use randpackageconfig: I fix a
certain arch/toolchain combination, and sent to a bit of
randpackageconfig. Which indeed means that I'm not testing everything
since the choices are not randomized.

Do we have a hope of getting properly randomized choices one day. Are
there other options?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
