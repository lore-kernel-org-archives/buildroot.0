From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Jun 2015 22:20:43 +0000 (UTC)
Subject: [Buildroot] [Bug 8156] pkg-kconfig infra broken for
	*-update-{config, defconfig}
In-Reply-To: <bug-8156-163@https.bugs.busybox.net/>
References: <bug-8156-163@https.bugs.busybox.net/>
Message-ID: <20150604222043.312AE81E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8156

--- Comment #8 from Floris Bos <bos@je-eigen-domein.nl> 2015-06-04 22:20:42 UTC ---
>[...] later bugs introduced with the support for kconfig fragments.
>For a starter, merge-config.sh does not bail out if the input file(s) do
>not exist.

But shouldn't make bail out with a "No rule to make target name-of-file" type
of error first because the input files do are listed as a dependency for
.config?

$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
