From: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Date: Fri, 2 Apr 2010 14:39:46 +0000 (UTC)
Subject: [Buildroot] Cross-compiling Problem with Boingo Embedded
	Wireless Toolkit for arm target
References: <dfcd449c1003260755n48095488u2d889fc176b1fb25@mail.gmail.com>
	<20100326202930.052b13b0@surf>
Message-ID: <loom.20100402T163026-757@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The problem was that Makefile.am files in package have includes like:

common_INC = -I/usr/include

What caused to include form.h from /usr/include instead of header from BEWT 
package.
