From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 26 Feb 2019 08:53:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/go: bump to version 1.12
In-Reply-To: <CA+h8R2qERZ1EjoyCiSCD32K8KM9m5OS_RdQ3iS59m9UmBUEwYw@mail.gmail.com>
References: <20190226034554.24429-1-christian@paral.in>
 <20190226082449.040c7a2a@windsurf.home>
 <CA+h8R2qERZ1EjoyCiSCD32K8KM9m5OS_RdQ3iS59m9UmBUEwYw@mail.gmail.com>
Message-ID: <CA+_SqVbzRuEgvansndPeSVqOeratEK5aGc+OGTc0e6j0FeJEkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Tue, Feb 26, 2019 at 8:46 AM Christian Stewart <christian@paral.in> wrote:
>
> Hi Thomas,
>
> On Mon, Feb 25, 2019 at 11:24 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > I am puzzled by your statement "currently undefined". Is it undefined
> > in the sense "it is not defined yet how Buildroot will handle this" or
> > "it is not defined in Go yet how the module compilation will work in
> > 1.13" ?
>
> The Buildroot approach to handling it is currently not defined. Go
> Modules are built around fetching from the network and verifying
> downloads within the Go tool itself, while Buildroot likely will avoid
> any network calls outside of the official Buildroot download
> mechanism.So, something else will have to be designed to fix this.

It's less of a problem with module support for go now, because the
dependencies are proxyed and verified before being delivered to the go
download mechanism, so the reproducibility is somewhat guaranteed.
The problem remains for breaking the buildroot internal download
mechanism and for not a so probably clear licensing of downloaded
modules (I have to investigate this).

I proposed the approach of tainting a buildroot configuration in such
cases but the series was not accepted...

>
> Best,
> Christian
