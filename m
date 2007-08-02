From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 2 Aug 2007 10:34:55 +0200
Subject: [Buildroot] staging_dir/usr/lib vs staging_dir/lib
In-Reply-To: <1185947996.20419.8.camel@localhost.localdomain>
References: <07c301c7d3a1$ebb2fdc0$2600a8c0@engineering5>
	<1185947996.20419.8.camel@localhost.localdomain>
Message-ID: <20070802083455.GI11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 01, 2007 at 07:59:56AM +0200, Hans-Christian Egtvedt wrote:

>Weird, because staging_dir/usr is a symlink to staging_dir/.

This means that you don't use a toolchain that supports sysroot.

For non-sysroot enabled toolchains we currently symlink staging_dir/usr
to staging_dir because the old, deprecated gcc had quite some trouble
otherwise and i don't care to fix them up (since the current stable
series of gcc work fine for me).

Please note that i, personally didn't enable sysroot support for 4.0.x
 but skhill did (IIRC) so you're better off to use 4.2.1 for this.
