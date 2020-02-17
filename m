From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Feb 2020 01:13:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5charts: fix install with
 per-package
In-Reply-To: <CAPi7W80D9eZJDs-0N+5SA1Z5PGJB-1hvn6h1Dz=aWW=SfSGKMQ@mail.gmail.com>
References: <20200216194230.1413696-1-fontaine.fabrice@gmail.com>
 <20200216212356.43072c64@gmx.net>
 <CAPi7W80D9eZJDs-0N+5SA1Z5PGJB-1hvn6h1Dz=aWW=SfSGKMQ@mail.gmail.com>
Message-ID: <20200217011357.2c7d1f95@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Feb 2020 22:03:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > The original 'libQt5Charts.so.2.1.3' file is installed into the qt5base per-package directory instead
> > of the qt5charts per-package directory one...  
> Indeed, you're right, I thought my patch was fixing the issue but it
> was not. The issue was fixed by running make qt5charts-dirclean and
> make qt5charts a second time ...
> It should be noted that the same kind of build failure are raised on
> qt5svg, qt5webengine, qt5xmlpatterns and qt5scripts.
> There is patch in patchwork from March 2019 that could fix this issue
> but it is set as superseded:
> https://patchwork.ozlabs.org/patch/1056425/.

Andreas Naumann (in Cc) is working on making Qt5 compatible with
per-package directory builds.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
