From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Aug 2019 17:33:00 +0200
Subject: [Buildroot] [PATCH] package/quagga: fix static linking with
 getopt
In-Reply-To: <20190801162408.16588-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Thu, 1 Aug 2019 18:24:08 +0200")
References: <20190801162408.16588-1-arnout@mind.be>
Message-ID: <87wof543mb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > quagga has its own copy of getopt_long() instead of using the system's,
 > and this copy also defines the opterr and optind variables. Obviously,
 > this is only apparent when linking statically.

 > This problem can easily be avoided by making sure that getopt() itself
 > is defined too. This way, there is no reason any more to pull in libc's
 > getopt() and the corresponding definitions of opterr and optind. Note
 > that getopt() itself is pulled in by netsnmp, not by quagga itself.

 > Fortunately, there's a REALLY_NEED_PLAIN_GETOPT flag that we can define
 > to make sure getopt() does get built by quagga. We can safely do this
 > unconditionally (instead of only when BR2_PACKAGE_QUAGGA_SNMP and
 > BR2_STATIC_LIBS are enabled): without netsnmp, getopt() will simply not
 > be used, and with dynamic libs there's no risk of conflicts anyway.

 > Fixes:
 > http://autobuild.buildroot.net/results/0ac598c2259a8d7e8b72d4e8ed95079675b31b84

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
