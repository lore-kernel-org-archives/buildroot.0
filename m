From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 17:57:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/openswan: not available on musl
In-Reply-To: <20160828164701.GC5758@free.fr> (Yann E. MORIN's message of "Sun, 
 28 Aug 2016 18:47:01 +0200")
References: <1469958682-6087-1-git-send-email-bernd.kuhls@t-online.de>
 <1469969267.9042.2.camel@embedded.rocks>
 <20160731160517.GJ3620@tarshish>
 <20160731230102.070d5413@free-electrons.com>
 <20160828164701.GC5758@free.fr>
Message-ID: <87twe34lfv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Thomas, Bernd, Baruch, All,
 > On 2016-07-31 23:01 +0200, Thomas Petazzoni spake thusly:
 >> On Sun, 31 Jul 2016 19:05:17 +0300, Baruch Siach wrote:
 >> 
 >> > netbsd-queue is a header only package, so it adds nothing to packages that 
 >> > don't use it. libglob adds libglob.so that is only useful for few packages. We 
 >> > can do something similar to way we handle gettext by adding
 >> > 
 >> >   select BR2_PACKAGE_LIBGLOB if BR2_TOOLCHAIN_USES_MUSL
 >> > 
 >> > for each such package.
 >> 
 >> Agreed.

 > In the meantime, the release is approaching, and libglob is not yet in
 > the tree.

 > So I think we should just hide openswan for musl, at least until after
 > the release.

 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Agreed - Committed, thanks.

-- 
Bye, Peter Korsgaard
