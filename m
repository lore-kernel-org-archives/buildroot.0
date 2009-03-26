From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Mar 2009 21:45:36 +0100
Subject: [Buildroot] svn commit: [25827] trunk/buildroot/package/automake
In-Reply-To: <20090326213421.55dae490@surf> (Thomas Petazzoni's message of
	"Thu\, 26 Mar 2009 21\:34\:21 +0100")
References: <20090326165522.5C989771F6@busybox.osuosl.org>
	<87tz5ggqup.fsf@macbook.be.48ers.dk> <20090326213421.55dae490@surf>
Message-ID: <87zlf8f1xr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> At least, my (maybe incorrect) change fixes the issue I reported in
 Thomas> the mail titled "Bug while autoreconfiguring tslib", sent today. But
 Thomas> maybe the correct fix is something like

 Thomas> - AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" $(HOST_DIR)/usr/bin/autoreconf -v -f -i -I "$(ACLOCAL_DIR)"
 Thomas> + AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" $(HOST_DIR)/usr/bin/autoreconf -v -f -i -I "$(HOST_ACLOCAL_DIR)"

I think the best/simplest solution is to just copy the aclocal files
of the cross tools (pkgconfig +auto*) from HOST_DIR to STAGING_DIR and
point ACLOCAL_DIR to STAGING_DIR - I'll give it a test.

 Thomas> BTW, could you remind me why we need to compile all these tools for the
 Thomas> host (pkg-config, automake, autoconf). Couldn't they be dependencies of
 Thomas> Buildroot ?

pkg-config to make it look in staging_dir and not the host directory,
and the auto* stuff simply because of the exact version dependencies
(E.G. certain stuff works with 2.61 and not with 2.63 or the other
way, so it keeps us a bit more sane to know that everyone uses the
same version).

-- 
Bye, Peter Korsgaard
