From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Tue, 7 Mar 2017 09:40:50 +0100
Subject: [Buildroot] [PATCH 1/1] dc3dd: new package
In-Reply-To: <4dccae11-d7e8-1dd8-2797-1336326fa392@mind.be>
References: <1488607456-30096-1-git-send-email-benoit.allard@greenbone.net>
 <043238f2-3640-b9c7-c86b-28c31e8c44d5@mind.be>
 <20170306165720.28face21@armant.office.greenbone.net>
 <4dccae11-d7e8-1dd8-2797-1336326fa392@mind.be>
Message-ID: <20170307094050.3ee1650a@armant.office.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 6 Mar 2017 17:41:48 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> 
> 
> On 06-03-17 16:57, Beno?t Allard wrote:
> > On Fri, 3 Mar 2017 23:42:49 +0100
> > Arnout Vandecappelle <arnout@mind.be> wrote:
> [snip]
> >>> +DC3DD_VERSION = 7.2.646
> >>
> >>  There is a version 7.2.641 which is identical except that it has
> >> an older (!) Changelog, and a different version number...
> >>
> >>> +DC3DD_SOURCE = dc3dd-$(DC3DD_VERSION).zip
> >>
> >>  and that version has a proper tar.xz.
> > 
> > Indeed, I will use that older version.
> 
>  Please mention in the commit log that they are identical and why we
> prefer the "older" one.

No problem.

> 
> >>> +DC3DD_SITE =
> >>> http://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSION)/dc3dd%20$(DC3DD_VERSION)
> >>> +DC3DD_LICENSE = GPLv3
> >>
> >>  I didn't do a full fossology but it looks like all files have the
> >> 'or later' clause, so it's GPLv3+
> > 
> > You are correct, most files have indeed the 'or later' mention.
> 
>  Can you please double-check that *all* files mention 'or later'? At
> least the ones that do have a copyright header. We don't want to be
> lying.
> 

Oh boy, that's gonna get fun. Fortunately, debian has a nice
"licensecheck" script (from the "devscripts" package in case you're
wondering) that can pretty well extract license information from source
code. Output attached.

Here, the files that have a copyright header and no "or later" stanza:

The following three are "freely distributable":
./src/hdparm/identify.c: UNKNOWN
./src/hdparm/hpa_dco.c: UNKNOWN
./src/hdparm/sgio.c: UNKNOWN

The following files are actually extracted from the GNU C library:
./lib/strcspn.c: GPL
./lib/stpcpy.c: GPL
./lib/strtoull.c: GPL
./lib/putenv.c: GPL
./lib/strtol.c: GPL
./lib/memcmp.c: GPL
./lib/stpncpy.c: GPL
./lib/memchr.c: GPL
./lib/utime.c: GPL
./lib/utimens.c: GPL
./lib/memchr2.c: GPL

Please advise.


> Also, it fails to build on musl, and uses threads. Use the test-pkg
> script to
> pre-test on the autobuilder toolchains, it just takes an hour or so on
> an average speed computer.

I've done that as well, and I had to add a patch to disable the
building of the man page as we don't need it and it failed on some
configurations.

New version incoming.

Regards,
Ben.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dc3dd-licensecheck
Type: application/octet-stream
Size: 18659 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170307/afd84d53/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170307/afd84d53/attachment.asc>
