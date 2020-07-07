From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 7 Jul 2020 12:21:25 +0200
Subject: [Buildroot] [PATCH] package/dvb-apps: add hash file
In-Reply-To: <20200705173702.GI2273@scaer>
References: <20200704010533.1854-1-sergio.prado@e-labworks.com>
 <20200705145430.20cc4911@windsurf.home>
 <20200705173702.GI2273@scaer>
Message-ID: <20200707122125.102c9bea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Jul 2020 19:37:02 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I too got that 926208 sha256 here, with two different hg versions: 3.7.3
> and 4.8.2.
> 
> > --2020-07-05 14:51:38--  http://sources.buildroot.net/dvb-apps/dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz  
> 
> dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz  2014-Sep-01 16:03:23 442.7K application/x-gtar-compressed
> 
> So, this file was created before the commit that made the archives
> reproducible. So, no surprise that the sha256 does not match the
> locally-created archive but that from s.b.o.

Here, since there is no hash file for dvb-apps in Buildroot in any
Buildroot version, we could change the tarball on sources.b.o.

It would of course be nicer if we could bump the version of dvb-apps,
so that we can keep this older tarball unchanged. But that's not
strictly required as we have never had any hash file for this package.

> The python-pygame archive was however created after commit 76b51f90c0e...
> 
> > requesting all changes
> > adding changesets
> > adding manifests
> > adding file changes
> > added 3652 changesets with 15404 changes to 1890 files (+17 heads)                                
> > new changesets 4609a0076cda:48e19c7b9ee9
> > ERROR: pygame-d61ea8eabd56.tar.gz has wrong sha256 hash:
> > ERROR: expected: f95a7dd68ea294d415e36e068d2f533c5a01c67773452d14a535c5c7455681fe
> > ERROR: got     : d5e0a43a4e338de4cb282af0ddd6e671055d6b9290030c27cfac41b1f7801232  
> 
> I too git d5e0a43a4e33.
> 
> What machine is pushing the archives to s.b.o. ?

I've added Peter in Cc, as he is taking care of the sources.b.o
maintenance. I think it is done on the OSUOSL machine, because Peter
has a script update-br-mirror.sh on this machine.

This machine has:

$ hg --version
Mercurial Distributed SCM (version 2.6.2)

So it is even older than the 3.x and 4.x Mercurial versions you have
tested.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
