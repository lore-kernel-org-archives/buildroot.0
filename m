From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 10:56:12 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722150320.43874326@free-electrons.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
 <55AF91EA.3080701@zacarias.com.ar>
 <20150722150320.43874326@free-electrons.com>
Message-ID: <55B789FC.6070001@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/07/15 10:03, Thomas Petazzoni wrote:

>>>>        powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/5c15e180973425a742629e9e8d0a56e1913d8c03/
>>>
>>> Smell very much like a too old kernel headers problem. Gustavo?
>>
>> Possible, though you know i generally hate those powerpc toolchains :)
>> I think it's time to kill them.
>
> I know you hate them. But I like them for one thing: they force us to
> keep testing with older kernel headers. Look at Luca Ceresoli, who is
> stuck with a 2.6.30 kernel.

The minimum required headers for iproute2 are 3.0, below that (2.6.39) 
it fails with namespaces. BPF is probably failing before ns because it's 
even older.
So it's probably time to exclude iproute2 for very old toolchains, but 
unfortunately openswan & ifupdown (not that important) will suffer from it.
It's possible openswan can work with busybox ip tools, i haven't tested 
that scenario, and unfortuantely (again) it's one of those packages that 
aren't so easy to test.
Regards.
