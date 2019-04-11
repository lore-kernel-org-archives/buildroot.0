From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 19:26:51 +0200
Subject: [Buildroot] [PATCH 00/10] infra: add solution to dump metadata
 from packages (branch yem/misc)
In-Reply-To: <cover.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <20190411192651.5196cd1c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Apr 2019 13:51:06 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> This series is a proposal to allow extracting metadata about packages,
> in a way that makes it reusable for tooling outside of Buildroot, that
> is both reliable and extendable, without causing too much burden on
> Buildroot own infrastructure.

Overall, I am quite happy with the general idea (as we have already
discussed). It allows to extract a lot of information about the
packages, in a format that is easily parseable.

My small annoyance is that we start to have some overlap between the
following mechanisms:

 - The "make printvars" mechanism, which essentially already allows to
   dump the metadata of all packages. Admittedly, in a format that is a
   lot less nice. I think this overlap is OK, since "make printvars" is
   mainly intended as a debugging mechanism, not so much as a real tool
   whose output can be parsed. The new JSON stuff could presumably be
   used as a replacement to "printvars" for people who need to
   currently parse the "printvars" output.

 - The "make legal-info" mechanism, which also outputs some metadata
   about the packages.

I'm not at all saying that we shouldn't merge this JSON output, I just
wanted to point out the different ways that already exist to extract
some package metadata out of Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
