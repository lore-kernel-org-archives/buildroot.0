From: Martin Hicks <mort@bork.org>
Date: Tue,  1 Mar 2011 09:34:22 -0500
Subject: [Buildroot] Add NFSv4 config option for nfs-utils
Message-ID: <1298990065-648-1-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This set of three patches adds a config option to enable NFSv4 in nfs-utils.
There is an extra library dependency that I had to add as a new package, and
an additional skeleton config file that is installed into /etc on the target.

I did find out that the "comment" block in Config.in stops Kconfig from properly
indenting BR2_PACKAGE_<FOO>_<SUBOPTION> from being intended properly, so I moved
it to the end of the file.  It still appears correctly when one of the toolchain
dependencies is not available.

Please let me know if there are any changes you'd like me to do.
