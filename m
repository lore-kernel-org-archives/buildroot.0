From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Dec 2020 22:46:13 +0100
Subject: [Buildroot] [PATCH next 06/12] package/tinifier: new package
In-Reply-To: <20201121180418.GP771438@scaer>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-7-thomas.petazzoni@bootlin.com>
 <CALq67GDBMGctf5xsftX+nWfn8e7arP_1XN5S2Amt9h9nE-H2pQ@mail.gmail.com>
 <20201121180418.GP771438@scaer>
Message-ID: <20201210224613.23b1e0ec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Nov 2020 19:04:18 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> legal-info is also something Thomas and I discussed and IRC when he
> posted his series.
> 
> We know it is not perfect, but this can be extended in a followup
> series.

Right.

> 
> > When I ran 'make legal-info' for the tinifier package all that is
> > mentioned in the 'manifest.csv' file for the package is:
> > 
> >    "tinifier","2.1.0","MIT","LICENSE","tinifier-2.1.0.tar.gz","https://github.com/tarampampam/tinifier/archive/v2.1.0","skeleton-init-common
> > [unknown] skeleton-init-none [unknown] toolchain-external-bootlin
> > [unknown]"
> > 
> > This doesn't give any indication or warnings that dependencies were
> > downloaded or that other open source license could be needed by
> > including this package.  
> 
> To simplify the series, my position as a first step would be to extend
> the FOO_LICENSE list in the infra, with just a very short notice,
> something like:
> 
>     FOO_LICENSE += , vendored licenses not listed

The problem is that we do not know if the vendoring was done by
Buildroot itself, or if vendored dependencies are provided directly in
the upstream repository, so it's difficult to add this only if
Buildroot has done the vendoring.

In addition, in both cases, the FOO_LICENSE of the package may very
well be completely accurate, taking into account all vendored
dependencies. Indeed, now that they are properly downloaded, nothing
prevents from having correct FOO_LICENSE and FOO_LICENSE_FILES values
for those packages.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
