From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Jan 2017 14:37:22 +0100
Subject: [Buildroot] [git commit] jsmn: new package
In-Reply-To: <20170128100442.D3EC581938@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 28 Jan 2017 23:03:31 +1300")
References: <20170128100442.D3EC581938@busybox.osuosl.org>
Message-ID: <87tw8j9ugd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=c8bd91bf8958b9644b9fe1965dd81b19507f0a7f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Signed-off-by: David Bachelart <david.bachelart@bbright.com>
 > [Thomas:
 >  - fix license, it's MIT, not BSD
 >  - use TARGET_CONFIGURE_OPTS instead of manually passing CC and AR
 >  - use full destination path
 >  - keep only sha256 hash
 >  - rewrap Config.in help text]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

[snip]

 > +define JSMN_INSTALL_STAGING_CMDS
 > +	$(INSTALL) -m 0644 $(@D)/libjsmn.a $(STAGING_DIR)/usr/lib/libjsmn.a
 > +	$(INSTALL) -m 0644 $(@D)/jsmn.h $(STAGING_DIR)/usr/include/jsmn.h

We normally use install -D to create the destination directories if
needed. I agree that these directories are very likely to be created
already, but for consistency -D would be nice.

-- 
Bye, Peter Korsgaard
