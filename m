From: Brendan Heading <brendanheading@gmail.com>
Date: Tue, 21 Jul 2015 13:15:25 +0100
Subject: [Buildroot] [PATCH] autobuild - acpid does not build against
	musl
In-Reply-To: <20150721092627.0fa306db@free-electrons.com>
References: <1437417346-18621-1-git-send-email-brendanheading@gmail.com>
 <20150720224152.11d13fa5@free-electrons.com>
 <CA+BsyQ7vZTqjt9OKgj_tcBTx=rC9zHCxzmN4wSPJ=20TD=MRwA@mail.gmail.com>
 <20150721092627.0fa306db@free-electrons.com>
Message-ID: <CA+BsyQ5zp_91uJ2hFX6LuxTwxfOa=TPFU2+jYxXVw8EVGWMidA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> The absence of TEMP_FAILURE_RETRY will break more than one package so
>> in retrospect it's probably more cleaner to try to fix it properly
>> rather than add patches to every package where it shows up. The only
>> downside is that acpid will be broken until it's resolved.
>
> But that's still the only reasonable solution. The idea being that
> those patches should be contributed to the upstream acpid project, so
> that we can drop them from Buildroot the next time acpid makes an
> official release.

I've raised a ticket on acpid2 and asked to submit my patch there.

RE some other issues you highlighted, such as duplicating the macro in
several places. There is no single header file which is included by
all sources; further, acpid2 has copies of the same header file in two
different directories, so I followed what you had already done for a
previous case (if you look in the package directory you can see your
patch which solves a similar problem in the same way).

I could add another header just for this macro and include it from
both places but that seems untidy and not consistent with what they
currently do.

I can submit a new patch here or get a steer from upstream first -
which is your preference ?

regards

Brendan
