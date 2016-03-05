From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 21:26:35 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-02-27
In-Reply-To: <1457208607.1867.7.camel@embedded.rocks>
References: <20160228073020.78AB7101EC4@stock.ovh.net>
 <1456651515.13955.2.camel@embedded.rocks>
 <87y4a5p3w5.fsf@dell.be.48ers.dk>
 <1456658221.13955.7.camel@embedded.rocks>
 <56D30D11.3030907@mind.be>
 <1456674270.13955.11.camel@embedded.rocks>
 <56D385A7.9050804@mind.be> <1457208607.1867.7.camel@embedded.rocks>
Message-ID: <20160305212635.54da8175@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

On Sat, 05 Mar 2016 21:10:07 +0100, J?rg Krause wrote:

> Building czmq with the latest git HEAD does not throw this error
> anymore.

Ah, do you know which commit fixed it?

> Although, for the current version 3.0.2 disabling the optional binaries
> zmakecert and zgossip also helps to build libczmq.la cleanly without
> the need to link libmath in. I've sent a patch to disable building both
> binaries by default [1].

This doesn't fix the problem at all. If you don't build libraries that
link with libczmq, then of course you don't see the undefined reference
again. It is only when linking a *program* that you will see such
undefined references, not when linking a library.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
