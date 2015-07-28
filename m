From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 16:02:11 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <55B789FC.6070001@zacarias.com.ar>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
 <55AF91EA.3080701@zacarias.com.ar>
 <20150722150320.43874326@free-electrons.com>
 <55B789FC.6070001@zacarias.com.ar>
Message-ID: <20150728160211.3300a733@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Tue, 28 Jul 2015 10:56:12 -0300, Gustavo Zacarias wrote:

> The minimum required headers for iproute2 are 3.0, below that (2.6.39) 
> it fails with namespaces. BPF is probably failing before ns because it's 
> even older.
> So it's probably time to exclude iproute2 for very old toolchains, but 
> unfortunately openswan & ifupdown (not that important) will suffer from it.
> It's possible openswan can work with busybox ip tools, i haven't tested 
> that scenario, and unfortuantely (again) it's one of those packages that 
> aren't so easy to test.

I am fine with the solution of having those packages use a >= 3.0
kernel headers dependency.

If someone wants openswan with the Busybox IP tools, they can
contribute :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
