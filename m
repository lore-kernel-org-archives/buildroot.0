From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Dec 2016 14:33:06 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-9zTDgFJki4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #5 from bilge at scriptfusion.com ---
post-build.sh is located here
https://github.com/Docker-nano/Buildroot/blob/2016.11/in/post_build.sh.

Its contents I have copied in below.

>#!/bin/bash
>
>[ -n "$TARGET_DIR" ] || exit
>
>cd "$TARGET_DIR"
>
>rm -rf root/.bash_* home/ftp

It just trims the fat by removing files that are presumed to be useless for the
majority of builds. I had not included it because it is thought to be
inconsequential.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
