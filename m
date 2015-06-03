From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Jun 2015 19:54:29 +0000 (UTC)
Subject: [Buildroot] [Bug 8156] pkg-kconfig infra broken for
	*-update-{config, defconfig}
In-Reply-To: <bug-8156-163@https.bugs.busybox.net/>
References: <bug-8156-163@https.bugs.busybox.net/>
Message-ID: <20150603195429.2E73C8194A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8156

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-06-03 19:54:28 UTC ---
Sorry, it works for me here, strictly following your step-by-step
procedure from a previously clean tree, and tested both the in-tree
and out-of-tree builds, both with a relative path (like "linux.config")
and an absolute path (like "$(O)/linux.config").

However, let's look at your traces:

    $ make linux-update-config
    /usr/bin/install -m 0644 linux.config
    /home/thomas/projets/buildroot/output/build/linux-4.0/.config
    /usr/bin/install: cannot stat 'linux.config': No such file or directory

The 'install' command is run when there is not yet a .config file
for the package (linux in this case). Saving back the defconfig file
is done with a plain 'cp' (followed by a touch).

So, it seems in your case, Linux is not configured, and there is no
/home/thomas/projets/buildroot/output/build/linux-4.0/.config file.

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
