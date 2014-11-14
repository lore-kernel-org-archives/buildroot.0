From: Mathieu Slabbinck <matty.slabbinck@gmail.com>
Date: Fri, 14 Nov 2014 15:27:43 +0100
Subject: [Buildroot] Source download overwrite
In-Reply-To: <20141114141445.77f68c2d@free-electrons.com>
References: <CAOFH_kEf-xur6tPGZb8rhA=211gK=Ww4tS0HRVpOe6KA-WEQMw@mail.gmail.com>
 <20141114141445.77f68c2d@free-electrons.com>
Message-ID: <CAOFH_kHZD-1aq31owR-D5GC_stX+zoGPiHyE1aovLGt6WZiOZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

thanks for pointing this out. Was looking for this kind of variable but
didn't really find any docs about it.
Managed to get it working now.

Thanks!

Mathieu

2014-11-14 14:14 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Mathieu Slabbinck,
>
> On Fri, 14 Nov 2014 10:24:58 +0100, Mathieu Slabbinck wrote:
> > Hi,
> >
> > I'm looking for a way to overwrite the internal download system of
> buidroot
> > for a specific homebrew package.
> >
> > The goal of the package is to download multiple files and install them
> > accordingly.
> > LIBFOO_SITE contains the common part of the download link. For example
> > ftp://myftpserver.mydomain.com/libfoo/.
> >
> > Then I'd like to have a pre-install hook that downloads some specific
> files
> > from that url, for example
> > - ftp://myftpserver.mydomain.com/libfoo/file1.deb
> > - ftp://myftpserver.mydomain.com/libfoo/file2.rpm
> > - ftp://myftpserver.mydomain.com/libfoo/file3.someExtension
> >
> > This all works fine, but the package still tries to fetch
> > ftp://myftpserver.mydomain.com/libfoo/.tar.gz because of the internal
> way
> > of working of buildroot.
> >
> > So how can I overwrite this method or disable it?
>
> Why don't you simply use the <pkg>_EXTRA_DOWNLOADS variable? It allows
> you to download additional files from the same site, which seems to be
> exactly what you're trying to achieve.
>
> LIBFOO_SITE = ftp://myftpserver.mydomain.com/libfoo/
> LIBFOO_SOURCE = <one file>
> LIBFOO_EXTRA_DOWNLOADS = <another file> <yet another file>
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141114/2283781e/attachment.html>
