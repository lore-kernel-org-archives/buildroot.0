From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Wed, 28 Jun 2017 10:00:52 -0700
Subject: [Buildroot] [PATCH] mtd: restore installation of libmtd to
	staging
In-Reply-To: <20170628082908.3e2808d9@windsurf.home>
References: <20170628035610.9945-1-yurovsky@gmail.com>
 <20170628082908.3e2808d9@windsurf.home>
Message-ID: <CAAkeqgWqN4buTM=SoG=m1OyXD8=sgm61VBzjg+MP-mDo-m1KpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 27, 2017 at 11:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Since it's an autotools package, it has a "make install" step that
> should install those libraries. I believe that if the upstream mtd
> doesn't install such useful libraries as part of its "make install"
> step, then we should instead patch the upstream Makefile.am, and
> contribute it upstream.

I can discuss it with them but the libmtd archives are part of
noinst_LIBRARIES in their build system so I suspect they don't intend
for external software like swupdate to actually use them (or are
otherwise not interested in supporting them as libraries).

I'm not sure what the right way to solve this is, for instance
swupdate could instead pull libmtd as a git submodule, build those
libraries, and link against them directly. I couldn't find anyone
beside swupdate needing them (for example rauc, which is roughly
equivalent to swupdate, actually forks off and runs the mtd-utils
shell commands to do the same job) so I wouldn't be surprised if
swupdate's usage is not standard. Either way, swupdate is effectively
broken in buildroot (if you want to talk to NAND Flash, UBI, etc) so I
wanted to have it working again but I am not sure where and how it
should be addressed.
