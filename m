From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 9 Mar 2015 08:27:09 +0000
Subject: [Buildroot] [PATCH 1/3] uclibc: adapt thread implementation
 selection to uClibc-ng
In-Reply-To: <20150308084147.4be140e3@free-electrons.com>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150307172039.GI3937@waldemar-brodkorb.de>
 <20150308084147.4be140e3@free-electrons.com>
Message-ID: <1425889628.5234.11.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, 2015-03-08 at 08:41 +0100, Thomas Petazzoni wrote:
> Waldemar, Alexey,
> 
> On Sat, 7 Mar 2015 18:20:39 +0100, Waldemar Brodkorb wrote:
> 
> > I am still unsatisfied about the ARC situation.
> > If you use this branch of gcc:
> > https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/tree/arc-4.8-tls
> > 
> > You get a working toolchain with TLS support and can use uClibc-git
> > or uClibc-ng 1.0.0 with NPTL.
> 
> I'm adding Alexey from Synopsys in Cc. Alexey, when do you think we can
> switch to a gcc version that has TLS support in Buildroot, for the ARC
> architecture ?
> 
> This would allow us to enable NPTL on ARC, using uClibc-ng.

We're actively working on enabling TLS/NPTL support for ARC and our
current plan is to get it done by the next release of ARC tools -
sometime later this spring.

Even though most of things in TLS/NPTL tools for ARC work pretty well
there're still issues to be resolved. And because this all is still in
works we don't yet have particular branches in binutils and gcc repos I
may recommend you to try.

As for uClibc we tend to apply all changes to "arc-mainline-dev" branch
in "https://github.com/foss-for-synopsys-dwc-arc-processors/uClibc"
repo.

Still I'd propose to wait a bit until we get something that could be
labeled as RC and then if you're willing to start running build or
run-time tests I'll let you know.

Anyway once we enable TLS/NPTL in GNU tools for ARC I'll send patch that
enables TLS for ARC in Buildroot - we're looking forward to having TLS
as a default option for ARC (as most of other arches do) because of
known benefits of TLS threading compared to Linuxthreads.

So stay tuned.

-Alexey
