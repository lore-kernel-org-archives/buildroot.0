From: Thomas Lundquist <lists@zelow.no>
Date: Wed, 14 Nov 2007 11:12:59 +0100
Subject: [Buildroot] buildroot with ipkg
In-Reply-To: <20070923204317.GF20058@aon.at>
References: <20070922222827.GD711@zelow.no> <20070923204317.GF20058@aon.at>
Message-ID: <20071114101259.GA2834@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 23, 2007 at 10:43:17PM +0200, Bernhard Fischer wrote:

About time I commit something package related but I feel we have to
agree.

> Earlier today, i thought a little bit about that, too. This would
> certainly be a nice thing to have. We would create a make-includeable
> file, let's say .auto.deps, that is included after BASE_TARGETS are set,
> but before including any other stuff.
> 
> .auto.deps could look something like:
> libpcap: $(BASE_TARGETS) zlib
> tcpdump: $(BASE_TARGETS) libpcap

This would then have to replace the SELECT and DEPENDS in Config.in.
having it in two places is dangerous.

make *config could do the include or merging.

> See r19978 and the log for it for further details and questions that
> arose.. (apart from my typo "thoughs welcome" which lack a "t"
> somewhere)

Have to admit I lost you there. Not sure what you meant.

For those wanting to read the comment:

http://buildroot.uclibc.org/cgi-bin/viewcvs.cgi?rev=19978&view=rev

Anyway; any reason I should NOT add my packages patchset? I know it's
not perfect but it's definately a start. the monkeywork of changeing all
the FOO_DIR thingies in every .mk file is a valid reason not to but I'm
willing to do it and I don't have a better solution for it.


Thomas.
