From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 13 Aug 2018 21:49:10 +0200
Subject: [Buildroot] Analysis of build results for 2018-08-09
In-Reply-To: <20180811001555.0b515e22@windsurf>
References: <20180810060017.0EEFE20719@mail.bootlin.com>
 <20180811001555.0b515e22@windsurf>
Message-ID: <20180813214910.6b6b1bef@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,
On Sat, 11 Aug 2018 00:15:55 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Fri, 10 Aug 2018 08:00:17 +0200 (CEST), Thomas Petazzoni wrote:
[...]
> 
> >   aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/1fe2be0f26e5b92db57a5cfb5646dd253b731a5c |       
> 
> This is just about adapting the Double-Conversion header to support AArch64 BE.
> 

Fixed by [1], compiles fine with the patch applied and using a
buildroot AArch64 BE generated toolchain...

> >         i686 |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/8b5531e44c4f4258c950902b2cd92d1ac8a8491e |       
> 
> Some crazy C++ error. Peter (Seiderer), could you have a look ?
> 

No clue either, maybe the used compiler
        $ ./host/bin/i686-ctng-linux-gnu-g++ --version
    i686-ctng-linux-gnu-g++ (crosstool-NG hg+-c65fcf8a34b7) 4.8.2

is to old for the c++11 [2] QPointer<QGeoMap> and QOverload<const QString &>::of(&QGeoMap::copyrightsChanged)
dance for the connect?

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/957169/
[2] http://doc.qt.io/qt-5/qtglobal.html#qOverload
