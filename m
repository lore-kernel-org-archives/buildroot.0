From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 23 Sep 2007 22:43:17 +0200
Subject: [Buildroot] buildroot with ipkg
In-Reply-To: <20070922222827.GD711@zelow.no>
References: <20070922222827.GD711@zelow.no>
Message-ID: <20070923204317.GF20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 23, 2007 at 12:28:27AM +0200, Thomas Lundquist wrote:

>I'd also would like to do dependencies and package descriptions based on
>the packages Config.in but then the script has to know where every
>targets Config.in resides which isn't obvious unfortunately.

Earlier today, i thought a little bit about that, too. This would
certainly be a nice thing to have. We would create a make-includeable
file, let's say .auto.deps, that is included after BASE_TARGETS are set,
but before including any other stuff.

.auto.deps could look something like:
libpcap: $(BASE_TARGETS) zlib
tcpdump: $(BASE_TARGETS) libpcap


See r19978 and the log for it for further details and questions that
arose.. (apart from my typo "thoughs welcome" which lack a "t"
somewhere)

thoughts?
