From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Dec 2017 16:37:07 +0100
Subject: [Buildroot] [PATCH 2/4] python-cffi: always install target
 python-pycparser
In-Reply-To: <20171213090424.11172-2-yegorslists@googlemail.com>
References: <20171213090424.11172-1-yegorslists@googlemail.com>
 <20171213090424.11172-2-yegorslists@googlemail.com>
Message-ID: <20171216163707.13cb65db@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Dec 2017 10:04:22 +0100, yegorslists at googlemail.com wrote:

> Some packages like python-crossbar, python-keyring use scripts,
> that check dependencies of all involved packages at runtime. And
> though cffi needs pycparser only in host variant during the bindings
> compilation, it still has pycparser in its setup.py as dependency.

It is not entirely clear to me what is happening here. Could you expand
a bit on this?

> So always installing pycparser along with cffi would create rather
> little overhead, but we won't have to check whether particular
> package has such a runtime script, that checks for dependencies.

I understand what you mean, but I find the wording confusing. It feels
as if you're saying that you're not going to do the change... that
you're doing in this commit.

What about:

"Since adding pycparser as a dependency to python-cffi adds only very
little overhead, we chose this solution as it avoids having to ..."

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
