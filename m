From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Oct 2019 10:13:03 +0200
Subject: [Buildroot] Linux kernel configuration changes and out of tree
 module builds
In-Reply-To: <CAAhKrJ2tKTbj=Tx+RHrk8BX7XBnbEjdKNM7YyHoKgb9wOmYYjw@mail.gmail.com>
References: <CAAhKrJ0GObte8z-NSqyUHwJY-0A1rbyrL-F5pW9G7LO_gyz3hQ@mail.gmail.com>
 <20191014225803.0b1765cc@windsurf.home>
 <CAAhKrJ2tKTbj=Tx+RHrk8BX7XBnbEjdKNM7YyHoKgb9wOmYYjw@mail.gmail.com>
Message-ID: <20191015101303.459b9ff2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dan,

On Mon, 14 Oct 2019 15:38:07 -0600
Dan Walkes <danwalkes@trellis-logic.com> wrote:

> Understood.  How about this modification?
> 
> * When a +FOO_DEPENDENCIES+ package is rebuilt or removed, the package
> foo is not automatically rebuilt.  For example, if a package +bar+ is
> listed in +FOO_DEPENDENCIES+ with +FOO_DEPENDENCIES = bar+ and the
> configuration of the +bar+ package is changed, the configuration
> change would not result in a rebuild of package package +foo+
> automatically.  In this scenario, you may need to either rebuild any
> packages in your build which reference +bar+ in their +DEPENDENCIES+,
> or perform a full rebuild to ensure any +bar+ dependent packages are
> up to date.

Seems good. Waiting for the documentation patches :-)

I think the main issue in our documentation is that currently this will
be added in the section of the documentation on how to add new
packages. But in fact, this explanation is not just relevant for people
adding new packages: it is relevant for people using Buildroot in
general. But well, the structure of our manual is not the best, and I
don't know where it could go. So at least, having the information
*somewhere* is better than not having it at all.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
