From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Oct 2015 21:39:43 +0200
Subject: [Buildroot] [PATCH v3] package/iqvlinux: new package
In-Reply-To: <561CACC5.5020600@mind.be> (Arnout Vandecappelle's message of
 "Tue, 13 Oct 2015 09:03:33 +0200")
References: <1444397162-5431-1-git-send-email-romain.naour@openwide.fr>
 <20151010150457.GD3640@free.fr>
 <20151012224411.472a9d10@free-electrons.com>
 <20151012211618.GG3735@free.fr>
 <20151012232441.3322b2fa@free-electrons.com>
 <561CACC5.5020600@mind.be>
Message-ID: <87zizj6hvk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> And the story is the same for xtable-addons: the additions in linux.mk
 >> were made because those kernel options were needed for xtable-addons to
 >> simply *build*.

 >  And of course I disagree with Thomas :-)

Heh ;)

 >  I think we should follow the principle of least surprise. We should avoid
 > situations where a package builds and we know for sure it will not work at
 > runtime. In many cases, this cannot be avoided, but if we can avoid it, we should.

It's not really that we *KNOW* that it won't build, it is more that we
cannot *GUARANTEE* that it will.

For this specific case, I think the issue is moot as people using this
package are most likely on x86 (where having a kernel config without PCI
is very unlikely), or atleast on a platform with PCI support enabled
(otherwise they cannot use the Intel MAC).

But yeah, I agree that we should try to make things work out of the box
(both build and runtime) where possible.

-- 
Bye, Peter Korsgaard
