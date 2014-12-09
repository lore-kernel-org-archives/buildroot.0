From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 08:51:34 +0100
Subject: [Buildroot] [PATCH] ltrace: disable elfutils unwinding when
 libunwind is used
In-Reply-To: <20141209060247.GJ2440@tarshish>
References: <8b0ae63676267c7fb215344ddb2ef959eaaf165d.1417763393.git.baruch@tkos.co.il>
 <20141207220014.1d0dede0@free-electrons.com>
 <20141209060247.GJ2440@tarshish>
Message-ID: <20141209085134.1b2051b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 9 Dec 2014 08:02:47 +0200, Baruch Siach wrote:

> > While I agree with the analysis, I don't agree with the proposed fix:
> > ltrace selects elfutils unconditionally (see Config.in), so it is quite
> > weird to see ltrace not using it in the end. So I believe the Config.in
> > *and* ltrace dependencies should be updated to reflect the fact that
> > either unwind or elfutils can be used.
> 
> It turns out that --with-elfutils=no is a misnomer. ltrace depends on libelf 
> regardless of --with-elfutils, so we must have elfutils both in Config.in and 
> in LTRACE_DEPENDENCIES. The only effect of --with-elfutils is on unwinding 
> back-end. Quoting configure.ac:
> 
>   AS_HELP_STRING([--with-elfutils], [Use elfutils libdwfl unwinding support]),
> 
> I'll send a revised version of this patch with a better commit log, and a 
> comment in the code explaining this weirdness.

Aah, ok. Indeed very confusing. Thanks for clarifying this and posting
an updated version with more details!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
