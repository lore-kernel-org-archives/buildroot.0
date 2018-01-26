From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 26 Jan 2018 15:55:08 +0100
Subject: [Buildroot] [PATCH 1/2] ltp-testsuite: disable numa tests
In-Reply-To: <20180126140830.fxuq6featonjyulh@tarshish>
References: <944db376505dab7095cf32949160c0d024d92926.1516964598.git.baruch@tkos.co.il>
 <20180126111703.65saceajkfpshqyr@dell5510>
 <20180126133700.hsnsyfj6owqo2wfz@tarshish>
 <20180126140830.fxuq6featonjyulh@tarshish>
Message-ID: <20180126145506.wqngirlpfgut24yl@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

> > As I understand this is about cross compilation, which is inherently 
> > incompatible with AC_RUN_IFELSE[1].

> > > Any idea how to fix it in upstream?

> Thinking about this a little more, I think you can make the test into a 
> compile time test instead of run-time with something like:

> #if LIBNUMA_API_VERSION < 2
> #error libnuma API version too old
> #endif
No, we had it, but we change it to the current state.  as we want to check for presence of
libnuma.so as well during build, as there is LTP library which is linked statically.
I know, this is very unusual, but that's how was LTP designed.

> baruch


Kind regards,
Petr

[1] https://www.gnu.org/software/autoconf/manual/autoconf.html#Runtime
