From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Nov 2018 17:23:07 +0100
Subject: [Buildroot] [PATCH] package/netsnmp: drop our custom config
 script fixups
In-Reply-To: <20181128204423.13058-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Wed, 28 Nov 2018 21:44:23 +0100")
References: <20181128204423.13058-1-yann.morin.1998@free.fr>
Message-ID: <87k1kv7t04.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Those custom fixups were added in 2011 with commit d1b42b24b88
 > (net-snmp: fixup paths in net-snmp-config) before we add generic config
 > scripts fixups in 2013 with commit 834f9311aac (pkg-infra: add
 > <pkg>_CONFIG_FIXUP to fix *-config files)

 > These custom fixups enclose the includes and libraries paths in single
 > quotes (presumably to protect them from further expnasion by the shell,
 > in case there are spaces for example).

 > It turns out that this breaks now that we replace the staging dir with
 > $(dirname $0), as it is between single quotes.

 > It looks like these fixups are really no longer needed anymore, since
 > the generic fixups do the job just fine (and better).

 > Fixes:
 >     http://autobuild.buildroot.org/results/2c5/2c5e379a06825bf8588bf070d733d2e1f98dab66/
 >     http://autobuild.buildroot.org/results/eea/eea704463c3f14dbb9bd7f8aa23d4b61c25987f4/

These are both on next, so I assume this is meant for next?

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
