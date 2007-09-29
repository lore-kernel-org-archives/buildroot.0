From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 29 Sep 2007 19:10:31 +0200
Subject: [Buildroot] Kernel Download Error with external toolchain
In-Reply-To: <1191084620.7864.16.camel@venture.bit63.org>
References: <1190985506.17683.6.camel@venture.bit63.org>
	<20070928180849.GQ20951@aon.at>
	<1191006117.5322.225.camel@elrond.atmel.sweden>
	<20070928191632.GT20951@aon.at>
	<1191012546.6616.15.camel@venture.bit63.org>
	<20070928205833.GA20951@aon.at>
	<1191084620.7864.16.camel@venture.bit63.org>
Message-ID: <20070929171031.GQ20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 29, 2007 at 12:50:20PM -0400, Clark Rawlins wrote:

>Let me rephrase to make sure I understand what you are saying.

>How close am I? :)

Yes, that'd be it.
For the dependency stuff (project_/$PROJ/buildroot-config), i'd prefer
to keep the names in the BR2_KERNEL_* hierarchy. A bit clumsy,
but nicer for the wildcards.

config BR2_KERNEL_SRC_IS_HEADERS
	bool "Use kernel tarball for both headers and kernel-binary"
	default y
	help
	  selfexplanatory but could need a more elaborate text

BR2_PACKAGE_LINUX_SRC_VERSION
	string "linux kernel version"
	default ""
	depends on !BR2_KERNEL_SRC_IS_HEADERS
	help
	  Specify the version of the linux kernel to use to
	  build the kernel binary.

or something like this
