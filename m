From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Jan 2020 18:31:01 +0000
Subject: [Buildroot] [Bug 12511] rng-tools has forced dependency on
 jitterentropy-library ; It slows boot considerably
In-Reply-To: <bug-12511-163@https.bugs.busybox.net/>
References: <bug-12511-163@https.bugs.busybox.net/>
Message-ID: <bug-12511-163-FHISvke00W@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12511

--- Comment #1 from Matt Weber <matthew.weber@rockwellcollins.com> ---
Sorry to hear about the boot delay issue.  The reason it was added by default
was I noticed the init script had handled a case of adding entropy when a hwrng
wasn't present. I didn't realize the impact when hwrng was enabled.

I agree, I think something like a new kconfig sub option named "enable source
jitterentropy" under rngd might be best (with a solid help description
outlining when to enable it).  There isn't a ideal way to get a linux config
option to trigger a dependency in the buildroot build.

We could tailor the initscript and have it check if there is a hwrng enabled by
checking for dev node existence if that is consistance.  However we can't
probably depend on the linux config being present and parse-able.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
