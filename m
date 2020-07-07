From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 7 Jul 2020 16:55:54 -0300
Subject: [Buildroot] [PATCH] package/dvb-apps: add hash file
In-Reply-To: <20200707122125.102c9bea@windsurf>
References: <20200704010533.1854-1-sergio.prado@e-labworks.com>
 <20200705145430.20cc4911@windsurf.home> <20200705173702.GI2273@scaer>
 <20200707122125.102c9bea@windsurf>
Message-ID: <CANu7NGvdi41J+4LeG8pxz4TCSrrfq+YKkAt66yc103YmDvY=Vw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Em ter., 7 de jul. de 2020 ?s 07:21, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> escreveu:
>
> Hello,
>
> On Sun, 5 Jul 2020 19:37:02 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> > I too got that 926208 sha256 here, with two different hg versions: 3.7.3
> > and 4.8.2.
> >
> > > --2020-07-05 14:51:38--
http://sources.buildroot.net/dvb-apps/dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz
> >
> > dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz  2014-Sep-01
16:03:23 442.7K application/x-gtar-compressed
> >
> > So, this file was created before the commit that made the archives
> > reproducible. So, no surprise that the sha256 does not match the
> > locally-created archive but that from s.b.o.
>
> Here, since there is no hash file for dvb-apps in Buildroot in any
> Buildroot version, we could change the tarball on sources.b.o.
>
> It would of course be nicer if we could bump the version of dvb-apps,
> so that we can keep this older tarball unchanged. But that's not
> strictly required as we have never had any hash file for this package.

Unfortunately there is no new version available. We are already using the
last commit from the repo:

$ hg clone https://linuxtv.org/hg/dvb-apps
destination directory: dvb-apps
requesting all changes
adding changesets
adding manifests
adding file changes
added 1506 changesets with 6093 changes to 2111 files
new changesets d9fe7e17226f:3d43b280298c
updating to branch default
$ cd dvb-apps/
$ hg branches
default                     1505:3d43b280298c
$ hg --debug id -i
3d43b280298c39a67d1d889e01e173f52c12da35

Best regards,

Sergio Prado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200707/06a1f43f/attachment.html>
