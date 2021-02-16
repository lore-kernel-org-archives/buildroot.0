From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Feb 2021 21:35:19 +0000
Subject: [Buildroot] [Bug 13516] utils/scanpypi: Failure when parsing
 diffoscope
In-Reply-To: <bug-13516-163@https.bugs.busybox.net/>
References: <bug-13516-163@https.bugs.busybox.net/>
Message-ID: <bug-13516-163-HQnyTNZslU@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13516

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Regarding the first issue, I guess we could change scanpypi to use python3
explicitly. Maybe it will break with some Python modules that have a
python2-only setup.py, but it should really be rare these days.

Regarding the second issue, I don't see what we can do. If I remember correctly
how scanpypi works, it works by running  the setup.py, so if the setup.py has
some requirement on a recent Python version... there's not much we can do about
it. You could for example do:

$ make host-python3
$ export PATH=$(pwd)/output/host/bin:$PATH
$ ./utils/scanpipy

and that should use the python3 built by Buildroot, which is recent enough.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
