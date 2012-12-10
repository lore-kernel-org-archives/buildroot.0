From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Dec 2012 13:35:42 +0100
Subject: [Buildroot] [git commit] ccache: uses fork(),
	therefore only usable on MMU platforms
In-Reply-To: <CALR4fEJsZQVHB_-KrvoVRmYN-s-sTemXFMB9FX_VAyTu7yiyVw@mail.gmail.com>
 (Diego Iastrubni's message of "Mon, 10 Dec 2012 14:15:35 +0200")
References: <20121209210012.5D1F49A157@busybox.osuosl.org>
 <CALR4fEJsZQVHB_-KrvoVRmYN-s-sTemXFMB9FX_VAyTu7yiyVw@mail.gmail.com>
Message-ID: <871ueyt78h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Diego" == Diego Iastrubni <diegoiast@gmail.com> writes:

 Diego> On Sun, Dec 9, 2012 at 10:49 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
 >> 
 >> diff --git a/package/ccache/Config.in b/package/ccache/Config.in
 >> index 4a37973..30e6578 100644
 >> --- a/package/ccache/Config.in
 >> +++ b/package/ccache/Config.in
 >> @@ -1,5 +1,7 @@
 >> config BR2_PACKAGE_CCACHE
 >> bool "ccache"
 >> +       # needs fork()
 >> +       depends on BR2_USE_MMU
 >> help

 Diego> Wait, what?

 Diego> What if I am corss compiling from i386 to blackfin? ccache can work on
 Diego> i386... the only problem is for target packages, not host packages.

This is a target package, E.G. ccache running on blackfin. You can still
use host-ccache for speeding up the cross compilation.

-- 
Bye, Peter Korsgaard
