From: Andreas Naumann <dev@andin.de>
Date: Mon, 17 Feb 2020 20:19:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5charts: fix install with
 per-package
In-Reply-To: <20200217011357.2c7d1f95@windsurf>
References: <20200216194230.1413696-1-fontaine.fabrice@gmail.com>
 <20200216212356.43072c64@gmx.net>
 <CAPi7W80D9eZJDs-0N+5SA1Z5PGJB-1hvn6h1Dz=aWW=SfSGKMQ@mail.gmail.com>
 <20200217011357.2c7d1f95@windsurf>
Message-ID: <5d345f8c-aab1-5df8-4cef-0f4f0376d1ab@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

Am 17.02.20 um 01:13 schrieb Thomas Petazzoni:
> Hello,
> 
> On Sun, 16 Feb 2020 22:03:48 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>>> The original 'libQt5Charts.so.2.1.3' file is installed into the qt5base per-package directory instead
>>> of the qt5charts per-package directory one...
>> Indeed, you're right, I thought my patch was fixing the issue but it
>> was not. The issue was fixed by running make qt5charts-dirclean and
>> make qt5charts a second time ...
>> It should be noted that the same kind of build failure are raised on
>> qt5svg, qt5webengine, qt5xmlpatterns and qt5scripts.
>> There is patch in patchwork from March 2019 that could fix this issue
>> but it is set as superseded:
>> https://patchwork.ozlabs.org/patch/1056425/.
> 
> Andreas Naumann (in Cc) is working on making Qt5 compatible with
> per-package directory builds.

Yes, actually I'm still not quite happy with what I have, or better, 
with the amount of testing that I got done, but I guess I'll just send 
what I have now and see your comments.

Anyway, my approach to fix above issue is to use per-package customized 
versions of qt.conf with the per-package sysroot and derive target 
install from these folders also.


best regards,
Andreas

> 
> Best regards,
> 
> Thomas
> 
