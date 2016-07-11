From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jul 2016 22:03:42 +0200
Subject: [Buildroot] [PATCH] core: do not remove dl/ directory on
	distclean
In-Reply-To: <20160711163446.GB3734@free.fr> (Yann E. MORIN's message of "Mon, 
 11 Jul 2016 18:34:46 +0200")
References: <1468187749-3955-1-git-send-email-yann.morin.1998@free.fr>
 <20160711032615.GJ3870@tarshish> <20160711163446.GB3734@free.fr>
Message-ID: <87a8ho9c2p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Baruch, All,
 > On 2016-07-11 06:26 +0300, Baruch Siach spake thusly:
 >> On Sun, Jul 10, 2016 at 11:55:49PM +0200, Yann E. MORIN wrote:
 >> > Currently, if the dl/ directory is the default location, it is removed
 >> > on distclean.
 >> > 
 >> > However, the dl/ directory is a precious location: it contains all the
 >> > tarballs downloaded so far, and some can be relatively huge, taking some
 >> > previous time to re-download, especially on slowish links.
 >> > 
 >> > Don't remove it on distclean. If the user really needs to regain some
 >> > space, leave it to him to clean this directory up manually.
 >> 
 >> Current Makefile help text for 'distclean' says:
 >> 
 >> delete all non-source files (including .config)
 >> 
 >> Not deleting the dl/ directory is not consistent with this description, IMO.

 > Well, I do understand it the other way: non-source files are deleted,
 > but source files are not deleted.

 > And I would argue that the content of dl/ *are* source files. If
 > anything, they are the archetype of source files.

 > Ergo, distclean should not remove them.

Sorry, I agree with Baruch. Distclean should leave the directory
structure like it was when the buildroot tarball was extracted (or git
cloned)

E.G. the GNU standard make targets state:

https://www.gnu.org/prep/standards/standards.html#Standard-Targets

?distclean?

Delete all files in the current directory (or created by this makefile)
that are created by configuring or building the program. If you have
unpacked the source and built the program without creating any other
files, ?make distclean? should leave only the files that were in the
distribution. However, there is no need to delete parent directories
that were created with ?mkdir -p?, since they could have existed anyway.

-- 
Bye, Peter Korsgaard
