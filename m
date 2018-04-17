From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Apr 2018 13:30:04 +0200
Subject: [Buildroot] [RFC PATCH 2/3] download/git: recover dirty cache
In-Reply-To: <20180417104213.GB8142@scaer>
References: <20180415120230.GA21958@scaer>
 <5ad41059af3a7_5cd73ffcbd32b2bc9895d@ultri4.mail>
 <20180416160124.GC2290@scaer> <20180416205614.GE2290@scaer>
 <1ffe206e-4b1e-c233-a511-ba4c3a8cb5f0@armadeus.com>
 <20180417104213.GB8142@scaer>
Message-ID: <20180417133004.2872797e@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Apr 2018 12:42:13 +0200, Yann E. MORIN wrote:

> Please! ;-)

On my side, I looked at the squashfs failures:

  http://autobuild.buildroot.net/?submitter=Thomas+Petazzoni+(Free+Electrons+server)&reason=%squashfs%

I looked at instance-1 and instance-2, both of which are failing, and
they look the same on the filesystem.

instance-2 looks like this:

$ tree -a instance-2/dl/squashfs
instance-2/dl/squashfs
|-- git
|   `-- .git
|       |-- FETCH_HEAD
|       |-- HEAD
|       |-- branches
|       |-- config
|       |-- description
|       |-- hooks
|       |   |-- applypatch-msg.sample
|       |   |-- commit-msg.sample
|       |   |-- post-update.sample
|       |   |-- pre-applypatch.sample
|       |   |-- pre-commit.sample
|       |   |-- pre-rebase.sample
|       |   |-- prepare-commit-msg.sample
|       |   `-- update.sample
|       |-- info
|       |   `-- exclude
|       |-- objects
|       |   |-- info
|       |   `-- pack
|       `-- refs
|           |-- heads
|           `-- tags
`-- squashfs-3de1687d7432ea9b302c2db9521996f506c140a3.tar.gz

So basically, there is a tarball of the previous squashfs version, and
the Git cache doesn't contain anything useful.

See
http://autobuild.buildroot.net/results/4f8/4f88b0aea78a8c8be245ec26e8e53f32d8a90eb5/build-end.log
for the actual build failure.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
