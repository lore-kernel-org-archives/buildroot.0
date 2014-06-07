From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Jun 2014 10:56:29 +0200
Subject: [Buildroot] [PATCH 4 of 7 v3] toolchain/toolchain-buildroot:
 migrate to virtual package infrastructure
In-Reply-To: <58ea2200cf19b356f9d9.1402085580@localhost>
References: <patchbomb.1402085576@localhost>
 <58ea2200cf19b356f9d9.1402085580@localhost>
Message-ID: <20140607105629.4126282a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 06 Jun 2014 22:13:00 +0200, Thomas De Schampheleire wrote:
> This patch migrates the toolchain and toolchain-buildroot packages to the
> virtual package infrastructure, causing the log messages to change from:
> 
> >>> toolchain undefined Downloading
> >>> toolchain undefined Extracting
> ...
> 
> to
> 
> >>> toolchain virtual Downloading
> >>> toolchain virtual Extracting
> ...
> 
> and similar for 'toolchain-buildroot', simply because it looks nicer.

While 'toolchain' is really a virtual package, 'toolchain-buildroot' is
a bit weird because it always pulls the same dependency
(host-gcc-final). But oh, well, I guess we can consider it as being a
virtual package that has only one provider.

So:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
