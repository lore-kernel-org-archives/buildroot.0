From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Mon, 08 Feb 2016 17:45:10 +0100
Subject: [Buildroot] [PATCH 1/1] skeleton: Rename /etc/profile.d/umask
	to umask.sh
In-Reply-To: <20160208172509.2e68a8ba@free-electrons.com>
References: <1454946165-8192-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <20160208172509.2e68a8ba@free-electrons.com>
Message-ID: <2274825.xfSUNdnLFA@hardbit>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

> I'd rather think that /etc/profile should source all files
> in /etc/profile.d/. At least that's what I would expect from a
> <something>.d/ directory.

Beware of backup files.  Such directories often end-up with ~-
terminated files (e.g., foobar~ after one edited foobar) and this 
often cause hard-to-detect bugs because of obsolete files being 
sourced.

If not relying on a common suffix, maybe you should use the same rules 
as Debian's run-parts?  These are:

If  neither  the --lsbsysinit option nor the --regex option is given 
then the names must consist entirely of ASCII upper- and lower-case 
letters, ASCII digits,  ASCII  underscores,  and ASCII minus-hyphens.

-- 
Thomas Claveirole <thomas.claveirole@green-communications.fr>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160208/0675f95b/attachment.asc>
