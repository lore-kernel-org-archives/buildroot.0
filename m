From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 14:42:18 +0200
Subject: [Buildroot] [PATCH 05/36] package/libiscsi: new package
In-Reply-To: <CAHXCMMK1cMmkCbOFU5=ZsCADzGrK-e0i7RYGu+XSFyYh9hU3Tw@mail.gmail.com>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-5-git-send-email-yann.morin.1998@free.fr>
 <20120817131432.205de8e1@skate>
 <CAHXCMMK1cMmkCbOFU5=ZsCADzGrK-e0i7RYGu+XSFyYh9hU3Tw@mail.gmail.com>
Message-ID: <20120817144218.2129fe41@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 17 Aug 2012 14:29:53 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> > You can instead use
> >
> > https://github.com/sahlberg/libiscsi/zipball/$(LIBISCI_VERSION)
> >
> > which will download a zip file of the project.
> 
> I think the right url is:
> https://github.com/downloads/sahlberg/libiscsi/libiscsi-1.5.0.tar.gz

Well, the above URL worked for me as well :)

> Though the zipball/tarball url is valid as soon as a tag is pushed in
> the repository, it will require some more plumbing in the download
> infrastructure since the downloaded file name is $(FOO_VERSION) with
> no extension. What a pity!

We have done changes to allow that for external toolchains (i.e
download a funky Git URL into a reasonably named tarball file), should
we do this for packages?

> > host-autoconf will not bring host-automake, so I think you should
> > either depend on host-automake (which itself depends on host-autoconf),
> > or you should do like the autotools package infrastructure does:
> > FOO_DEPENDENCIES += host-automake host-autoconf host-libtool.
> 
> I would assume that the autotools-package infrastructure automatically
> pulled these host dependencies...

It does if you do FOO_AUTORECONF=YES. But in this case, the
FOO_AUTORECONF mechanism doesn't work because the source tree lacks a
m4/ directory, needed for autoreconf. Usually, the packages come with
some ./autogen or ./autogen.sh or ./bootstrap script doing the
necessary preparation + autoreconf call, but there is no really
commonly adopted best practice here.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
