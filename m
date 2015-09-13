From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 13 Sep 2015 20:20:49 +0000 (UTC)
Subject: [Buildroot] [Bug 8331] kexec fails due to missing /usr/sbin/shutdown
In-Reply-To: <bug-8331-163@https.bugs.busybox.net/>
References: <bug-8331-163@https.bugs.busybox.net/>
Message-ID: <20150913202050.0606980456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8331

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2015-09-13 20:20:49 UTC ---
Hmm, looking at the kexec source code I see:

static int my_shutdown(void)
{
        char *args[] = {
                "shutdown",
                "-r",
                "now",
                NULL
        };

        execv("/sbin/shutdown", args);
        execv("/etc/shutdown", args);
        execv("/bin/shutdown", args);

        perror("shutdown");
        return -1;
}

So having shutdown in /sbin seems fine?

Can you please provide more info about your config and what goes wrong?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
