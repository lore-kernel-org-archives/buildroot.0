From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 21 Nov 2016 14:51:46 +0000
Subject: [Buildroot] [arc-buildroot] Analysis of autobuild failures
	18-19/11
In-Reply-To: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
References: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
Message-ID: <1479739849.4199.68.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

On Sat, 2016-11-19 at 20:23 +0100, Arnout Vandecappelle wrote:
> ?Hi all,
>?
> http://autobuild.buildroot.net/results/f2a001031af381388cff71b4de1103fc11e08239
> xtensa	jack2-v1.9.10	uclibc	
> 
> > 
> > ../dbus/sigsegv.c: In function 'signal_segv':
> > ../dbus/sigsegv.c:110:20: error: 'NGREG' undeclared (first use in this function)
> > ?????for(i = 0; i < NGREG; i++)
> > ????????????????????^
> > ../dbus/sigsegv.c:110:20: note: each undeclared identifier is reported only once for each function it appears in
> > ../dbus/sigsegv.c:119:38: error: 'mcontext_t {aka struct sigcontext}' has no member named 'gregs'
> > ?????????????????ucontext->uc_mcontext.gregs[i]
> 
> ?Lots of similar failures exist with uClibc, but only on xtensa and arc.
> Incomplete / incompatible struct sigcontext definition maybe? Waldemar?


That's a long-standing problem we discussed in quite a detail some time ago, see
http://lists.busybox.net/pipermail/buildroot/2016-May/161785.html?and
http://lists.busybox.net/pipermail/buildroot/2016-June/162461.html

I've just sent a patch with Thomas' solution to the problem at hand,
pls find it here -?http://patchwork.ozlabs.org/patch/697273/

-Alexey?
