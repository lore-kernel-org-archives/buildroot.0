From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 May 2017 19:02:38 +0000
Subject: [Buildroot] [Bug 9866] BASE_DIR usage
In-Reply-To: <bug-9866-163@https.bugs.busybox.net/>
References: <bug-9866-163@https.bugs.busybox.net/>
Message-ID: <bug-9866-163-dN7XBiCUlR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9866

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to Yann E. MORIN from comment #3)

Actually you don't need to do anything like that. All scripts are executed from
the buildroot toplevel directory, so the only thing you need to do is to ensure
the correct .config is used (.config or $(O)/.config). This is taken care by
the BR2_CONFIG variable, so just do:

make BR2_CONFIG=$BR2_CONFIG printvars

-- 
You are receiving this mail because:
You are on the CC list for the bug.
