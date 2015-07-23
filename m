From: Julien CORJON <corjon.j@ecagroup.com>
Date: Thu, 23 Jul 2015 12:54:25 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-07-22
In-Reply-To: <20150723063018.EA19A101D01@stock.ovh.net>
References: <20150723063018.EA19A101D01@stock.ovh.net>
Message-ID: <55B0E400.9060702@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Let's have a lot on Qt build failure.

Le 23/07/2015 08:30, Thomas Petazzoni a ?crit :
> Build statistics for 2015-07-22
> ===============================
>
>          success : 229
>         failures : 182
>         timeouts : 2
>            TOTAL : 413
>
> Classification of failures by reason
> ====================================
...
>                   qt5base-5.5.0 | 7
...
>             qt5multimedia-5.5.0 | 1

...
>
> Detail of failures
> ===================
>
...
>        x86_64 | make: *** [qt5script-legal-... | NOK | http://autobuild.buildroot.net/results/951448b9788d515fc285a460e2964506a0b77bf9/
>           arm | make: *** [qt5svg-legal-inf... | NOK | http://autobuild.buildroot.net/results/741c9a24676b3efdef9457d9c4b175c1498a811a/
...
>        x86_64 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/4be77432390c4cfb557c3f2cc52cf732de037949/
>           arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/255a77e01d8af4090e03acb82f9ad93b7c4dd212/
>       powerpc |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/11edf8d741a69b266eb631cacffe6aa95b8e3b31/
>           arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/7844e6a3eeecf67dc29277b73bfe714e4d8f0d85/
>      mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/b941f35b6c8e1cf3b2c4b046dfcce98700d8f408/
>           sh4 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/c64b640a39285f59cde47cb8d06ab70a5ac97c8b/
>           arc |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/f6d24b50f58251c8051d39bc1d09b5b43f81f441/
>           arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/bd7273a53ed4e0fede5de0d386ec8828888da9ca/
>

== Legal info bug (9151448 / 741c9a24)
Should be fixed by your commit 
http://git.buildroot.net/buildroot/commit/?id=bdd522f9213788d404540f5c016bdd431d9be04a
Qt licensing is king of a mess right now... Qt Website does not give the 
same licenses as modules packages (GPLv2 vs. GPLv3). We should find 
someone at Qt company to have some certitude.

== Qt5base - Big endian issue on DestFormat (11edf8d)
Should be fixed by my commit 
http://git.buildroot.net/buildroot/commit/?id=1ffbcceea9148afe835d41435e4df7a7e2b2e35e

== Qt5base - qplatformpixmap.h not found (4be77432 / 255a77e / 7844e6a / 
b941f35 / c64b640 / f6d24b50)
I asked the question here : https://bugreports.qt.io/browse/QTBUG-47400
Let see if I can have an answer. In the meantime i have sent a patch for 
buildroot : https://patchwork.ozlabs.org/patch/499371/

== Qt5multimedia - target copy of libggsttools*.so* (bd7273a5)
GStreamer stuff. In case gst-plugin-base is selected we try to copy 
libqgsttools* which is not found for an unknown reason. I currently 
investigating this one

Regards,

Julien
