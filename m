From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 31 Jul 2007 10:38:58 +0200
Subject: [Buildroot] Redundant kernel patches in the
	snapshot	from20070718
In-Reply-To: <1185839954.30603.36.camel@elrond.sweden.atmel.com>
References: <1185459798.1044.43.camel@localhost.localdomain>
	<1185468722.5580.107.camel@elrond.sweden.atmel.com>
	<20070727113002.GF22789@aon.at>
	<026b01c7d2c2$cbcd3460$dcc4af0a@atmel.com>
	<20070730192728.GA27993@aon.at> <20070730200247.GC29064@aon.at>
	<1185839954.30603.36.camel@elrond.sweden.atmel.com>
Message-ID: <20070731083858.GA3797@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 31, 2007 at 01:59:14AM +0200, Ulf Samuelsson wrote:

Can we settle on the following procedure:

You provide a full patch that does the final migration to unpack and
patch a kernel for each project, install it's headers into the project
specific dir (from within target/linux/Makefile.in, if you prefer).
I'd like to review (and eventually discuss) this patch before it is
finally committed.

Whether you rm toolchain/kernel-headers or not (and how you deal with
kernel-headers-old vs. kernel-header-new) is up to you. I just want to
do this migration in one (tested) step.

Most of the needed steps do already exist, it's merely a matter of
unpacking the kernel in the project specific dir and decide how to
handle patches, i.e. whether to only apply exact patches or try to apply
them if they _could_ do the right thing.

Ok?
