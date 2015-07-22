From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:14:51 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <1437577561.3396.13.camel@synopsys.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
 <1437577561.3396.13.camel@synopsys.com>
Message-ID: <20150722171451.344d7398@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 22 Jul 2015 15:06:01 +0000, Alexey Brodkin wrote:

> Looks like this is because a missing commit in uClibc - 
> Remember that discussion - http://lists.busybox.net/pipermail/uclibc/2014-September/048597.html?
> That was applied to uClibc-ng but not to uClibc which we closely following.
> Will ping Bernard once again because patch still applies perfectly fine.
> 
> Sent a not to Bernard asking to apply it to uClibc master.

Good luck to get anything merged in uClibc :-)

In the mean time, maybe we can get this patch in
package/uclibc/arc-2015.06/, or you could carry it in your Git
repository ?

> I bet this is a pre-built toolchain back from arc-2015.06-rc1 days.
> Please update it to something more up to date. At least I cannot reproduce this with
> newer toolchain.

Right.

> > >          arc |                   zeromq-4.0.5 | NOK | 
> > > http://autobuild.buildroot.net/results/9ba4de85136e9ac4a68dcb7ee4285e03168d4a15/
> > 
> > Toolchain problem:
> > 
> >   CXX      libzmq_la-sub.lo
> > socket_base.cpp: In member function 'void zmq::socket_base_t::event_connected(std::string&, int)':
> > socket_base.cpp:1157:1: error: Internal consistency failure: cfi row mismatch [-Werror]
> >  }
> >  ^
> 
> This is a known thing in arc-2015.06 release.
> So please consider prebuilt toolchain update.

I don't understand this one: arc-2015.06 is the latest release used in
Buildroot. Why would rebuilding the toolchain solve this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
