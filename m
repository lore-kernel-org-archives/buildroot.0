From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 06 Mar 2016 10:47:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-02-27
In-Reply-To: <20160305212635.54da8175@free-electrons.com>
References: <20160228073020.78AB7101EC4@stock.ovh.net>
 <1456651515.13955.2.camel@embedded.rocks> <87y4a5p3w5.fsf@dell.be.48ers.dk>
 <1456658221.13955.7.camel@embedded.rocks> <56D30D11.3030907@mind.be>
 <1456674270.13955.11.camel@embedded.rocks> <56D385A7.9050804@mind.be>
 <1457208607.1867.7.camel@embedded.rocks>
 <20160305212635.54da8175@free-electrons.com>
Message-ID: <1457257674.2724.10.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sa, 2016-03-05 at 21:26 +0100, Thomas Petazzoni wrote:
> J?rg,
> 
> On Sat, 05 Mar 2016 21:10:07 +0100, J?rg Krause wrote:
> 
> > 
> > Building czmq with the latest git HEAD does not throw this error
> > anymore.
> Ah, do you know which commit fixed it?

Yes, I did a bisect and found
commit?bcf583633e8b27a9bfbed1e4a717b9373f7446be [1]. I'll send a patch
including the upstream patch.

> > 
> > Although, for the current version 3.0.2 disabling the optional
> > binaries
> > zmakecert and zgossip also helps to build libczmq.la cleanly
> > without
> > the need to link libmath in. I've sent a patch to disable building
> > both
> > binaries by default [1].
> This doesn't fix the problem at all. If you don't build libraries
> that
> link with libczmq, then of course you don't see the undefined
> reference
> again. It is only when linking a *program* that you will see such
> undefined references, not when linking a library.

I see! Thanks for clarifying that!

[1]?https://github.com/zeromq/czmq/commit/bcf583633e8b27a9bfbed1e4a717b
9373f7446be

Best regards
J?rg Krause
