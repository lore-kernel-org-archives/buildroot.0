From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jan 2016 14:51:53 +0100
Subject: [Buildroot] Standardizing format for specifying license(s)
In-Reply-To: <1a9e07dbd834ef9ca57e1b6a91d043c2@localhost>
References: <5698DDBE.3000402@imgtec.com>
 <1a9e07dbd834ef9ca57e1b6a91d043c2@localhost>
Message-ID: <20160115145153.39e486e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander,

On Fri, 15 Jan 2016 14:12:47 +0100, Alexander Dahl wrote:

> If not already done, I would suggest to have those license stuff
> compatible with SPDX [1]. I noticed license names in at least some
> packages are not the same as the identifiers on
> https://spdx.org/licenses/ ? so if someone wants to generate SPDX stuff
> from a buildroot project, it maybe would be better to have a format for
> names and delimiters which make it easier towards SPDX package data.

We normally try to use the SPDX license code, at least for "new"
licenses (i.e licenses for which we don't yet have a single Buildroot
package under that license). However, for the first licenses (like GPL,
LGPL, etc.), we have started using an encoding that is not the one from
SPDX. I would personally be in favor to move to SPDX license codes
everywhere, but that would break things for people that are currently
parsing our license information. Is this reasonable to do nonetheless?

The Buildroot documentation already has a license of license
abbreviations:
https://buildroot.org/downloads/manual/manual.html#legal-info-list-licenses.

Note that http://spdx.org/sites/spdx/files/SPDX-2.0.pdf, page 82 and
83, has a description of a syntax for composite license expressions.

One case that SPDX doesn't allow to encode is "GPL" or "LGPL", i.e the
cases where the software is said to be licensed under the GPL or LGPL,
but without any version information. Yes this sucks because in practice
it means you don't know the corresponding license text. But sometimes,
this is the only information provided by the package source code.

Examples:

MII_DIAG_LICENSE = GPL # No version specified
tslib/tslib.mk:TSLIB_LICENSE = GPL, LGPL

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
