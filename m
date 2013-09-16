From: Ralph Siemsen <ralphs@netwinder.org>
Date: Mon, 16 Sep 2013 08:46:12 -0400
Subject: [Buildroot] [PATCH v3] apply-patches.sh: detect missing patches
In-Reply-To: <8738p5i6kq.fsf@dell.be.48ers.dk>
References: <20130905140135.GC3136@free.fr>
 <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
 <20130911120630.GA14745@harvey.netwinder.org>
 <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
 <20130913181527.GA11933@harvey.netwinder.org>
 <20130913182702.GB3301@free.fr>
 <20130915133709.GA16826@harvey.netwinder.org>
 <20130915141314.GA18166@harvey.netwinder.org>
 <8738p5lud2.fsf@dell.be.48ers.dk> <8738p5i6kq.fsf@dell.be.48ers.dk>
Message-ID: <20130916124612.GB24501@harvey.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 16, 2013 at 09:11:49AM +0200, Peter Korsgaard wrote:
> 
> The tarball contains:
> 
> debian/
> debian/control
> debian/postinst
> debian/postinst.nfs
> debian/source/
> debian/source/options
> debian/source/format
> debian/shlibs
> debian/prerm.nfs
> debian/rules
> debian/postrm
> debian/shlibs.nfslock
> debian/patches/
> debian/patches/07-493462-dotlockfile.c.patch
> debian/patches/series
> debian/patches/04-505851-remove-debug-code.patch
> debian/patches/02-COPYRIGHT.patch
> debian/patches/06-493462-dotlockfile.1.patch
> debian/patches/09-562937-make-ar-overwrittable.patch
> debian/changelog
> 
> So a bunch of non-patch files. I guess our best option is to degrade the
> "Unsupported format" check to a warning again?

Hmm, none of the packages I regularly build have used this feature.

Going back to a warning would be a simple fix. The other option would
be to expand the tarballs and extract only the patches directory.
I'm not sure which option is better...

-Ralph
