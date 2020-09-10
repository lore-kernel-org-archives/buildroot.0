From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 10 Sep 2020 16:39:18 +0000
Subject: [Buildroot] [arc-buildroot] Toolchain issues on multiple
 architectures
In-Reply-To: <20200910120536.2431494d@windsurf.hq.k.grp>
References: <20200910120536.2431494d@windsurf.hq.k.grp>
Message-ID: <BN8PR12MB3330260C7D57EE97065A5DC0A1270@BN8PR12MB3330.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> As part of the https://toolchains.bootlin.com/  project, I've tried to
> rebuild 175 toolchains on top of Buildroot 2020.08, and encountered a
> number of failures, which are summarized below.

[snip]
 
> ARC maintainers: all ARC toolchains are failing to build due to the use
> of a recent gdb where gdbserver was moved to the top-level. However, it
> doesn't seem to be that easy to build just gdbserver in those recent
> gcc versions. I have posted a question about this on the gdb@ mailing
> list: https://sourceware.org/pipermail/gdb/2020-September/048888.html.

[snip]

> ARC
> ===
> 
> All configurations are failing.
> 
> Issue is caused by the recent version of gdb, where gdbserver has been
> moved from gdb/gdbserver/ to gdbserver/. However, the story is not so
> simple: you can't simply go in gdbserver/ and run ./configure from it,
> that doesn't work anymore.

But in your exercise mentioned above do you really need only gdbserver?
I understand that full GDB might be quite an overkill for a tiny target but
it might not be installed onto the target rootfs, right?

So what if for GDB 10+ we'll add an installation quirk which will remove
full GDB from "output/target" if we only want gdbsever?

-Alexey
