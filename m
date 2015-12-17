From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 17 Dec 2015 16:43:04 +0000
Subject: [Buildroot] [Bug 8536] Building sudo with PAM results in unusable
	sudo
In-Reply-To: <bug-8536-163@https.bugs.busybox.net/>
References: <bug-8536-163@https.bugs.busybox.net/>
Message-ID: <bug-8536-163-dM6KImwQ8X@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8536

--- Comment #1 from James Knight <james.knight@rockwellcollins.com> ---
I'm not a PAM expert, but I assume if you're integrating PAM support into sudo,
I believe it requires the respective PAM configuration for sudo to work
(/etc/pam.d/sudo). If anyone knows that this is not the case, I'd be interested
to know.

Trying to reproduce, building with "--without-pam", I can configure a default
user to perform sudo operations. If I build with "--with-pam" and I do not have
"/etc/pam.d/sudo" configured, all requests are denied. If I use the
"--with-pam" build with "/etc/pam.d/sudo" configured, it works fine. Is this
what you are experiencing?

If integrating PAM support into sudo requires PAM configuration (ie. cannot
fall back onto just sudo configuration), I'm curious if you have a desired use
case to not include PAM support for sudo (while having other packages use it as
well). If this is a the case, maybe there should be a configuration option
which defaults to include PAM support (when the PAM package exists) which can
be explicitly disabled by the developer.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
