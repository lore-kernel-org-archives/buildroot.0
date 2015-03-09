From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 18:55:49 +0100
Subject: [Buildroot] [PATCH] gdb: fix target gdb building from git
In-Reply-To: <1424768600-10056-1-git-send-email-abrodkin@synopsys.com>
References: <1424768600-10056-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150309185549.625180ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 24 Feb 2015 12:03:20 +0300, Alexey Brodkin wrote:
> Currently we only add "host-texinfo" dependency for host GDB built
> from git sources. But in case of target gdb texinfo won't be built
> and so gdb building will fail on attempt to build documentation.
> 
> Fix is trivial - add "host-texinfo" as a dependency for target gdb
> in the sme way as we disable documentation building via both
> GDB_CONF_ENV (for target) and HOST_GDB_CONF_ENV (host) GDB flavors.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>

Do you have a failing configuration for this one? I've tried to build
the ARC target gdb today, without selecting cross-gdb (so that the
host-texinfo dependency is not pulled in), and I couldn't get a failure.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
