From: Leonid <Leonid@a-k-a.net>
Date: Fri, 28 Sep 2007 16:24:40 -0700
Subject: [Buildroot] Buildroot filesystem files' ownership
In-Reply-To: <1191013693.5322.252.camel@elrond.atmel.sweden>
References: <1190969812.5322.96.camel@elrond.atmel.sweden><1190996888.5322.198.camel@elrond.atmel.sweden><20070928170109.GO20951@aon.at>
	<1191013693.5322.252.camel@elrond.atmel.sweden>
Message-ID: <406A31B117F2734987636D6CCC93EE3C023DD3FE@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi:

Buildroot documentation claims that entire filesystem can be created
without root priviliges and this is true. However as a result all files
in filesystem, residing in TARGET_DIR (even device nodes) belongs to
USER, not to root. While trying to NFS into such filesystem, it doesn't
work (no console output). I have expected that files which must belong
to root will be "massaged" by fakeroot but this doesn't happen at least
for TARGET_DIR.

When I change ownership of all files in the filesystem to root

sudo chown -Rf root.root .

NFS is working fine. Questions:

1) May be filesystem in the TARGET_DIR is not supposed to be used as
real target FS - one must use .ext, .jffs2,... images? Where I get
filesystem for NFS then?

2) What files in the filesystem MUST belong to root - I suspect my
changing all of them to root is overkill.

Thanks,

Leonid. 
