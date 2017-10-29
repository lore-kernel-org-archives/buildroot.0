From: Florian Fainelli <f.fainelli@gmail.com>
Date: Sat, 28 Oct 2017 19:06:20 -0700
Subject: [Buildroot] [RFC 0/2] Add support for specifying a custom kernel
	directory
Message-ID: <1509242782-14524-1-git-send-email-f.fainelli@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series allows specifying a custom kernel directory which could be an
existing git tree. This is particularly useful when doing kernel development
and having an existing git checkout where development is happening.

Ideally, I would like to avoid doing the rsync operation involved with the "local" method
and instead just have a symbolic link from /path/to/kernel -> output/build/linux.

Comments welcome!

Florian Fainelli (2):
  pkg-generic: Don't check for trailing slashes for local method
  linux: Add support for specifying a custom directory

 linux/Config.in                        | 10 ++++++++++
 linux/linux.mk                         |  3 +++
 package/linux-headers/linux-headers.mk |  5 +++++
 package/pkg-generic.mk                 |  2 ++
 4 files changed, 20 insertions(+)

-- 
2.7.4
