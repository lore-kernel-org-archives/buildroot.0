From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 28 Sep 2015 20:46:33 +1300
Subject: [Buildroot] [RFC PATCH 0/1] Generating package skeletons
Message-ID: <1443426394-13595-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Not sure if this has come up before but I figured most of the 'standard'
things for adding a package[1] can be somewhat automated, and that
automation might solve some of the minor style issues that crop up.

But just because something _can_ be automated it doesn't necessarily
follow that something _should_ be automated. By my (fairly unscientific)
count between 2015.05 and 2015.08 there were 95 new packages and between
2015.08 and master there are 36 new packages (so far). Having a script
to generate the skeleton for those packages would have saved a few
keystrokes (although I haven't checked that my script would generate
something valid for those 95/36 packages).

Is this an idea worth pursuing (adding docs, handling cases like
SITE=$(call github, ...) and git/hg repositories)?

[1] - http://buildroot.org/downloads/manual/manual.html#adding-packages

Chris Packham (1):
  scripts: Add gen-package.py

 support/scripts/gen-package.py | 266 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 266 insertions(+)
 create mode 100755 support/scripts/gen-package.py

-- 
2.5.0
