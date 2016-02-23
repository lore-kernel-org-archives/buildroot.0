From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 23 Feb 2016 21:19:46 +0100
Subject: [Buildroot] [PATCH v1] qt: add font license information
In-Reply-To: <20160223135110.064721b6@free-electrons.com>
References: <1434140535-13792-1-git-send-email-ps.report@gmx.net>
 <56CB9524.3090704@mind.be>
 <20160223135110.064721b6@free-electrons.com>
Message-ID: <20160223211946.08dbb7c6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 23 Feb 2016 13:51:10 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Arnout,
> 
> Thanks a lot for having reviewed this patch, which is not very simple
> in terms of licensing details.
> 
> On Tue, 23 Feb 2016 00:09:24 +0100, Arnout Vandecappelle wrote:
> 
> >  The problem with the way that it's done now is that the different licenses will
> > not be comma-separated while they usually are. But adding commas is difficult in
> > this case, so OK.
> 
> I thought we could do something such as:
> 
> QT_LICENSE += Foo (bar),
> QT_LICENSE += Bar (foo),
> QT_LICENSE += Baz (boz),
> QT_LICENSE := $(patsubst %$(comma),%,$(QT_LICENSE))
> 
> But it unfortunately seems to remove all commas. We could then do:
> 
> QT_FINAL_LICENSE = $(shell echo "$(QT_LICENSE)" | sed 's:\(.*\),:\1:')
> 
> Not super pretty, but it's just one line of crap.

O.k. will take it for the next patch version...

Regards,
Peter

> 
> Thomas
