From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Jun 2017 09:25:04 +0000
Subject: [Buildroot] [Bug 9996] lz4 package does not install lz4 binaries in
	target
In-Reply-To: <bug-9996-163@https.bugs.busybox.net/>
References: <bug-9996-163@https.bugs.busybox.net/>
Message-ID: <bug-9996-163-d1ZqfzuKLM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9996

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|lz4 option does not install |lz4 package does not
                   |lz4 binaries in ramdisk     |install lz4 binaries in
                   |                            |target

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
This was done by commit 8ad38a4fc2007df4bee9a941aed46c8771b6a84c by Gabe Evans.
It's a simple version bump, the commit message mentions nothing of this change:

    package/lz4: bump version to r131

    systemd v228 requires lz4 >= 125

    Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
    [Thomas: only pass PREFIX=/usr at install time instead of using
    LZ4_MAKE_OPTS, and also pass it for the host installation.]
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

So I guess it was an accident. Gabe, can you comment?

Jamin, could you send the patch (with a proper commit message and a
Signed-off-by) to the Buildroot mailing list so we can retain your authorship?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
