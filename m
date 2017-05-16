From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 May 2017 19:11:31 +0000
Subject: [Buildroot] [Bug 9866] BASE_DIR usage
In-Reply-To: <bug-9866-163@https.bugs.busybox.net/>
References: <bug-9866-163@https.bugs.busybox.net/>
Message-ID: <bug-9866-163-9Sr7mqmwtv@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9866

--- Comment #5 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Peter Korsgaard from comment #4)

Except that in this case you'll be missing on any br2-external tree, or any
local.mk, as:

  - br2-external is set in .br-external in CONFIG_DIR
  - local.mk is by default in CONFIG_DIR

but CONFIG_DIR is not in .config...

In retrospect, I think we should just export CONFIG_DIR, as it's
CONFIG that can clash, not CONFIG_DIR (AFAICS...)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
