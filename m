From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Feb 2020 10:21:39 +0100
Subject: [Buildroot] CVE tracking for selected packages
Message-ID: <CAAXf6LURHBGiU6zTD-KQ85R+MjUxn9vJQc04-ViEXuS1r6HvCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

With the recent addition of CVE checks in the pkg-stats script, we
have made a great step forward, and anyone can check the list at:
http://autobuild.buildroot.org/stats/ to see which packages have which CVEs.

What would be another great improvement, is the possibility to check
for a given defconfig in a particular Buildroot tree (i.e. not
necessarily the master) which CVEs are not yet solved.

Basically something like:

    make cve-info

which would list only those CVEs applicable for the packages selected,
so that a user knows directly if action is required or not for their
particular case.

Alternatively, we could add the info to 'make show-info', but since
obtaining the info will also require a download of the CVE databases,
I assume this is not desired.

For the implementation, I assume we should either create a make target
to call pkg-stats with the list of packages required, and perhaps
restricting to CVE checking only (instead of also version checking),
or extract the CVE logic to another file that can be reused by both
pkg-stats as the new thing.

Feedback welcome!

Thomas
