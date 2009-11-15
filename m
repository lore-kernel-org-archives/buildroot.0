From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Nov 2009 20:24:07 +0100
Subject: [Buildroot] [PATCH 4/8] flex: add flex-host package (required
	by webkit)
In-Reply-To: <1258308289.24296.94.camel@coalu.atr> (Lionel Landwerlin's
	message of "Sun\, 15 Nov 2009 19\:04\:49 +0100")
References: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
	<1258279977-1482-5-git-send-email-llandwerlin@gmail.com>
	<20091115152653.29810036@surf> <1258299584.24296.91.camel@coalu.atr>
	<87ws1ryd6v.fsf@macbook.be.48ers.dk>
	<1258308289.24296.94.camel@coalu.atr>
Message-ID: <87skcfy4ko.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

Hi,

 >> You must install 'flex' on your build machine
 >> 
 >> make: *** [dependencies] Error 1

 Lionel> I will recheck again tomorrow, it was on a machine at work (RH
 Lionel> enterprise 5).

OK.

 Lionel> By the way, what's the policy about host packages that should be
 Lionel> included in buildroot ?

Well, we try to keep the amount of dependencies low to make it easy to
use, but within sane limits ofcourse, we don't want to build an entire
host system as well.

There's no hard fixed rules in other words. Certain things just have to
be there (shell, make, toolchain). For the rest it's a question about:

 - How big is the dependency (E.G. how much effort to compile for host)
 - How version specific is the dependency (E.G. autoconf)
 - How "standard" is the dependency - E.G. can we reasonably expect it
   to be available on all/most developer machines?

-- 
Bye, Peter Korsgaard
