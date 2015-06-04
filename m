From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Jun 2015 22:45:08 +0000 (UTC)
Subject: [Buildroot] [Bug 8156] pkg-kconfig infra broken for
	*-update-{config, defconfig}
In-Reply-To: <bug-8156-163@https.bugs.busybox.net/>
References: <bug-8156-163@https.bugs.busybox.net/>
Message-ID: <20150604224508.8D49A80E09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8156

--- Comment #10 from Floris Bos <bos@je-eigen-domein.nl> 2015-06-04 22:45:08 UTC ---
(In reply to comment #9)
> Floris,
> 
> (In reply to comment #8)
> > But shouldn't make bail out with a "No rule to make target name-of-file" type
> > of error first because the input files do are listed as a dependency for
> > .config?
> > 
> > $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
> 
> Yep, I would have expected so, too. But it does not...
> 
> I'm using make-3.81, and it does not error-out. I've installed a
> make-4.0, and it does not break either.

Strange, that dependency rule did work for me when I submitted and tested the
kconfig patch.

And seems it worked for Arnout as well:
http://lists.busybox.net/pipermail/buildroot/2015-May/127584.html

But that's when running make normally with a fragment file missing that do was
specified. Haven't tested the exact scenario reported in this bug, and looked
what might make it different.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
