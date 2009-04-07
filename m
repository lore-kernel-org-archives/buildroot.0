From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Apr 2009 19:02:43 +0200
Subject: [Buildroot] JFFS2 / MTD suggestions
In-Reply-To: <20090407083540.15437e75@surf> (Thomas Petazzoni's message of
	"Tue\, 7 Apr 2009 08\:35\:40 -0700")
References: <20090407083540.15437e75@surf>
Message-ID: <878wmc2y8c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hi,

 Thomas> When selecting jffs2 as the output filesystem, mtd-utils gets
 Thomas> compiled both on the host and on the target. I think that
 Thomas> generating a jffs2 filesystem image should *not* trigger the
 Thomas> compilation/installation of mtd-utils inside the target since
 Thomas> this is not necessary.

Agreed.

 Thomas> Moreover, the compilation of host mtd-utils fails with
 Thomas> "lzo/lzo1.h not found" if the liblzo-dev package is not
 Thomas> installed on the host. We should probably add a test checking
 Thomas> this and telling the user to install liblzo-dev, because the
 Thomas> current state is quite confusing.

Or even better, compile lzo for the host and link against that.

-- 
Bye, Peter Korsgaard
