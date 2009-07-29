From: Igor Serebryany <igor47@moomers.org>
Date: Tue, 28 Jul 2009 20:33:05 -0500
Subject: [Buildroot] installing binaries
Message-ID: <20090729013305.GG7257@moomers.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

	I've been having a hard time figuring out how buildroot decides to
	install binaries. Using 2009.02 or 2009.05, I often find that the
	binaries for the packages I've selected do not make it into
	project_build_ARCH/myproject/root

	Is there a way to tell buildroot to go through every selected
	package and copy the binaries to the image? Even if I have to delete
	some target file in each folder, it would be better then the other
	two alternatives I've come up with:
	1) copying all the binaries to the root by hand
	2) modifying the prefix in the Makefiles for all packages and doing
	'make install' for each one individually


	I think I get all the packages if I make distclean and then make,
	but many packages fail to compile the first time (like util-linux
	which always requires a lot of hacking) and I hate to loose my
	modifications via make distclean

	Trying 'make clean' is futile, as most packages fail to clean and
	make clean always errors out half-way through.

	I've been working on this for a few days now, so I appreciate any
	tips...

--Igor
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090728/b78dac9c/attachment.pgp>
