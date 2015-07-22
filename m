From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 22 Jul 2015 18:27:15 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <55AF6B19.7010702@openwide.fr>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
 <55AF6B19.7010702@openwide.fr>
Message-ID: <20150722162715.GC6432@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,
Romain Naour wrote,

> >>       x86_64 |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/6b1e2132a34e0c263bb0f2ea31caf4ce697e9c9c/
> > 
> > Another uClibc static linking problem. Waldemar?
> > 
> 
> Waldemar, I think you can skip this issue since I'm working on the efl bump to
> the latest release and I had to disable the efl package for uClibc-ng.
> 
> I had a link issue:
> lib/eina/.libs/libeina.so: undefined reference to `mkstemps'
> It turn out that mkstemps and mkostemps are not available in uClibc-ng.

Do you have a patch to test your bump and the issue with buildroot?
May be efl developers could be convinced to use something more standard like?
mkstemps() seems very glibc specific.

best regards
 Waldemar
