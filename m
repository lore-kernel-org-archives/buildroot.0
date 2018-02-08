From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 09:05:57 +0100
Subject: [Buildroot] [PATCH v2 1/5] package/gdb: rework dependency for
 C++11
In-Reply-To: <129e81ee-1a4e-10bd-16c2-996bedba6875@mind.be>
References: <20180205211015.26819-1-thomas.petazzoni@bootlin.com>
 <20180205211015.26819-2-thomas.petazzoni@bootlin.com>
 <20180207095828.GA2464@scaer> <20180207133602.36f7646a@windsurf>
 <20180207173440.GA2250@scaer>
 <129e81ee-1a4e-10bd-16c2-996bedba6875@mind.be>
Message-ID: <20180208090557.69911f6b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Feb 2018 01:22:20 +0100, Arnout Vandecappelle wrote:

>  So I messed around with gdb a bit, I noticed a couple of things.
> 
> - gdbserver really needs C++11; some of the shared files in the common directory
> are C++ files.

Correct.

> - host-gdb does not build gdbserver. So all the dependencies we have in host-gdb
> on the target's toolchain are phony. Or perhaps they are there just in case
> target gdb is selected as well, but then it's not expressed very well...

Those target toolchain dependencies in the host-gdb package where here
to avoid selecting a wrong version of host-gdb (which affects the
target gdb version) when the target toolchain does not have the
required feature. For example, we would allow to select 8.0 only if the
host toolchain *and* the target toolchain had C++11 support.

My PATCH 1/5 in this series is precisely here to rework that.

>  Bottom line, I think could be simplified a lot here by removing the version choice.

Everything can be simplified with less options, it's pretty obvious.
The question is whether having those options is useful :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
