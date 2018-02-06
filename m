From: Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 6 Feb 2018 17:03:50 +0800
Subject: [Buildroot] patchwork.ozlabs.org down, and e-mails not recorded
In-Reply-To: <981ecf77-767e-3c90-243f-67251d956c21@au1.ibm.com>
References: <20180105214340.6f0cc1f7@windsurf>
 <ced2aeb2-82f6-c836-dd5a-e65c6b49c81a@au1.ibm.com>
 <20180108091044.1141f540@windsurf> <20180205224500.1a34e02a@windsurf>
 <981ecf77-767e-3c90-243f-67251d956c21@au1.ibm.com>
Message-ID: <7cac4285-81cb-d35b-e576-159106da69ba@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Andrew,

> jk, any idea whether there's something particular about the ozlabs.org
> instance that could be causing it to drop these patches?

We're running plain upstream with regards to the parsing code; so if it
parses we should be fine there.

Assume the parsing is OK, there are a couple of reasons for potential
drops:

  - the database server was down at the time of parse. This is quite
    infrequent, but can happen during database upgrades. The last one of
    those was at 2018-01-27 05:08:30 UTC, so doesn't look like the case
    here

  - after the update to 2.x, database load has significantly increased;
    there have been occasions where db connections are rejected due to
    this. The recent patchwork update should address some issues there,
    but I'm not sure whether we're back to optimal db behaviour now...

Cheers,


Jeremy
