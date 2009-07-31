From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 31 Jul 2009 01:40:53 +0000 (UTC)
Subject: [Buildroot] [Bug 505] live555: new package
In-Reply-To: <bug-505-163@https.bugs.busybox.net/>
References: <bug-505-163@https.bugs.busybox.net/>
Message-ID: <20090731014053.84B4F777E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=505





--- Comment #4 from Kelvin Cheung <keguang.zhang@gmail.com>  2009-07-31 01:40:52 UTC ---
(In reply to comment #2)
> This rule in the makefile looks wrong to me:
> 
> $(STAGING_DIR)/usr/include/live: $(LIVE555_DIR)/liveMedia/libliveMedia.a
>         cp -a $(LIVE555_DIR) $(STAGING_DIR)/usr/include/
> 
> The whole source tree is copied into /usr/include in the staging_dir?
> 

Yes, the installation is a little strange.
The live555 does not provide 'make install', so we have to install it manually.

Copying the source tree into /usr/include is mainly for MPlayer-1.0rc2.

It will autodetect whether live555 (both header file and archive) was installed
to default or specified path.

See [Bug 507]: https://bugs.busybox.net/show_bug.cgi?id=507 


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
