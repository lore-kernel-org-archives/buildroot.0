From: Matt Johnson <mj1856@hotmail.com>
Date: Fri, 14 Jan 2011 09:19:10 -0700
Subject: [Buildroot] fontconfig: bump to version 2.8.0
In-Reply-To: <20110114092850.1fb27fc1@surf>
References: <BAY145-w55783B9ED56A589ABC3816C2F30@phx.gbl>
	<20110114092850.1fb27fc1@surf>
Message-ID: <BAY145-ds14C51F7DDAD975EF4B45E1C2F30@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> In the commit description, would be great to say that the
parallel-compilation-fix patch is no longer necessary since it has been
merged upstream

Yes, the parallel compilation fix was no longer necessary.  Thanks for the
link, I would have had no idea where to look, I just saw that the changes
were already in the 2.8.0 sources.

In regards to the use_for_build patch, I wasn't sure why it was in there to
begin with.  However I didn't see any specific reason to remove it, since
the files it touches have not changed.  I just updated the version number
references.

Also, one thing I didn't mention is that these lines:

-# This package does not like using the target cflags for some reason.
-FONTCONFIG_CONF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/freetype2"

, were removed because of the same missing target cflags (for -march) issue
that I described recently in the freetype and rubix packages.  I found the
comment to be untrue, even under the old version 2.6.0. I had no problem
compiling with the target cflags in place.  Perhaps someone can shed light
on why that was added in the first place?  Maybe on a different platform
than mine it fails.

-Matt
