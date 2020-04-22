From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 22 Apr 2020 14:23:36 +0300
Subject: [Buildroot] [PATCH] package/linux-tools: selftests: add numactl
 dependency for net tests
In-Reply-To: <20200421165510.0616fc36@windsurf.home>
References: <20200325164240.22747-1-vadim4j@gmail.com>
 <20200411152649.3830039d@windsurf.home>
 <20200421175140.n5l3vn7rh642widp@vkochan-ThinkPad-T470p>
 <20200421165510.0616fc36@windsurf.home>
Message-ID: <20200422112336.6cwyac5wim5i43n2@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Apr 21, 2020 at 04:55:10PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 21 Apr 2020 20:51:40 +0300
> Vadim Kochan <vadim4j@gmail.com> wrote:
> 
> > > So, I think we should:
> > > 
> > >  - Pass FORCE_TARGETS=1 during the build so that the build aborts if a
> > >    required dependency is not found.
> > > 
> > >  - Switch to using more optional dependencies, and disable the TARGETS
> > >    that we cannot build by passing the appropriate SKIP_TARGETS value
> > >    to the Makefile.
> > > 
> > > Could you work on this ? We probably need to make libcap-ng optional,
> > > but also popt. The other options that are selected by
> > > BR2_PACKAGE_LINUX_TOOLS_SELFTESTS might also need to be revisited.
> > > 
> > > An alternative is to just say that we don't care about making all of
> > > that optional, and simply unconditionally enable all the dependencies
> > > that selftests need, to build everything. Easier, but that's not the
> > > normal Buildroot design principle.
> > > 
> > > Best regards,
> > > 
> > > Thomas  
> > 
> > Yes, I understand your point. I think it would be useful to add config
> > options per each selftests subsystem to easy turn it on.
> 
> I don't know if we really want to add one sub-option for each selftest
> subsystem, that would be quite a lot.
> 
> However, we should properly enable/disable selftest subsystems
> depending on the availability of the necessary dependencies. For
> example, if numactl is enabled, then we enable the network-related
> selftests, otherwise we disable them.
> 
> Best regards,
> 
> Thomas

My only concern is that user should guess which packages are needed for
particular test suites (I mean at least per sub-system), or document it
somewhere ?

Regards,
Vadym Kochan
