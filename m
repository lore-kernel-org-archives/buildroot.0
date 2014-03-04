From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 09:14:00 +0100
Subject: [Buildroot] [git commit] linux: only depend on host-lzop if
	needed
In-Reply-To: <87mwh679ls.fsf@dell.be.48ers.dk>
References: <20140303212321.09FDC9B9F2@busybox.osuosl.org>
 <87mwh679ls.fsf@dell.be.48ers.dk>
Message-ID: <20140304091400.4213b502@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 04 Mar 2014 07:37:19 +0100, Peter Korsgaard wrote:

> Doesn't this get executed very early, E.G. before the linux sources are
> extracted?

Indeed, but the configuration file is already available at this point.
It may be either a full .config, or a minimal defconfig, but in both
cases it doesn't matter. See below.

> Does it work with configurations using a defconfig in the kernel sources like sheevaplug_defconfig?

It does, as explained in the commit log: since LZO is not the default
compression, if it is chosen by the user in its kernel configuration,
it will also appear in minimal defconfigs.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
