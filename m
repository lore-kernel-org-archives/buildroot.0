From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 22:07:59 +0100
Subject: [Buildroot] [PATCH 1/1] ca-certificates: new package
In-Reply-To: <20140108045207.GD4659@sapphire.tkos.co.il>
References: <1389126590-25956-1-git-send-email-martin@barkynet.com>
 <20140108045207.GD4659@sapphire.tkos.co.il>
Message-ID: <20140128220759.54d86241@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 8 Jan 2014 06:52:07 +0200, Baruch Siach wrote:

> > +CA_CERTIFICATES_VERSION = 20130906
> > +CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.gz
> > +CA_CERTIFICATES_SITE = ftp://ftp.debian.org/debian/pool/main/c/ca-certificates
> 
> Please use $(BR2_DEBIAN_MIRROR). See package/at/at.mk, for example.

No. We don't want to use BR2_DEBIAN_MIRROR. This should be removed.

The problem with normal Debian mirrors is that files disappear after
some time (when Debian packages are updated). Instead, we should use
snapshot.debian.net everywhere.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
