From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 8 Feb 2018 09:56:23 +0100
Subject: [Buildroot] [PATCH] ltp-testsuite: add numactl as optional
 dependency
In-Reply-To: <7416baae-37f5-ad95-ce69-8b5ef882f48b@mind.be>
References: <cd25369f9e0588a17965bbabcf6214c110f86ef4.1518030288.git.baruch@tkos.co.il>
 <20180207194907.GA1349@x230>
 <7416baae-37f5-ad95-ce69-8b5ef882f48b@mind.be>
Message-ID: <20180208085621.objfhwbywogpfkgp@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

<snip>
> >> +# No explicit enable/disable options
> >> +ifeq ($(BR2_PACKAGE_NUMACTL),y)
> >> +LTP_TESTSUITE_DEPENDENCIES += numactl
> >> +else
> >> +LTP_TESTSUITE_CONF_ENV += have_numa_headers=no
> >> +endif
> >> +
> >>  # ltp-testsuite uses <fts.h>, which isn't compatible with largefile
> >>  # support.
> >>  LTP_TESTSUITE_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
> > Thanks for implementing it, LGTM.
> > I just think whether it wouldn't be better to create config option
> > BR2_PACKAGE_LTP_TESTSUITE_LIBNUMA which would select numactl (this would also inform user
> > about this dependency).

>  We generally don't do that unless there is a very good reason, to avoid
> proliferation of Config.in options. In this case, I don't see a very good reason.
OK, thanks for info.
Yesterday we added --without-numa config option to properly disable and there will probably be some more as people demand it. So I thought it would be good for people to be able to choose.


Kind regards,
Petr
