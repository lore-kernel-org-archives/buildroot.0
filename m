From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 3 Nov 2015 22:25:32 +0100
Subject: [Buildroot] [PATCH] boost: fix sparc64 compile,
 set the correct instruction-set
In-Reply-To: <20151103220543.06ed88e9@free-electrons.com>
References: <20151103210313.GA25989@waldemar-brodkorb.de>
 <20151103220543.06ed88e9@free-electrons.com>
Message-ID: <20151103212531.GI21428@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Dear Waldemar Brodkorb,
> 
> On Tue, 3 Nov 2015 22:03:14 +0100, Waldemar Brodkorb wrote:
> 
> > +ifeq ($(BR2_sparc64),y)
> > +BOOST_OPTS += architecture=sparc instruction-set=ultrasparc
> > +endif
> 
> We're not setting architecture= nor instruction-set= for any other
> architecture. Should we do so ?
> 
> Should the instruction-set be set to BR2_GCC_TARGET_TUNE ?

You mean BR2_GCC_TARGET_CPU? No, because leon3 is not set in boost.

To do minimal damage to other architectures, I would just
set it for sparc/sparc64. The boost architecture does not always
match the buildroot architecture name. (f.e. ppc is power)

I think 0003-Remove-bogus-c3-cpu-varant-for-SPARC.patch could be
removed, when a correct setting is used for sparc32.

best regards
 Waldemar
