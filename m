From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 18:34:32 +0100
Subject: [Buildroot] libgomp.so.1.0.0 not in target image
In-Reply-To: <CABtOAfzcjFWUVELMn0X4fRF8fcdqBL5HsBzo7sw1wt8JJc+Ghw@mail.gmail.com>
References: <CABtOAfzcjFWUVELMn0X4fRF8fcdqBL5HsBzo7sw1wt8JJc+Ghw@mail.gmail.com>
Message-ID: <50A284A8.9070304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/12 16:30, Alexander Khryukin wrote:
> Hello.
> I'm built rpm5 package but when i trying to run it i see
>
> [root at localhost rpm]# rpmbuild
> rpmbuild: error while loading shared libraries: libgomp.so.1: cannot open shared object file: No such file or directory
>
> Lib not exist in filesystem but exit into
>
>
> find . -name *gomp*
> ./output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/libgomp.spec
> ./output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/libgomp.so.1.0.0
> ./output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/libgomp.so
> ./output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/libgomp.a
> ./output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/libgomp.la <http://libgomp.la>
> ./output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/libgomp.so.1
>
>
> It's a bug or feature?

  Yep, that's a bug. It's surprising that nobody has run into this before - maybe
OpenMP support was only recently added to the Linaro toolchain.

  Alexander, you are using a recent external Linaro toolchain, right?

  Thomas, I think this should be fixed by adding libgomp to LIB_EXTERNAL_LIBS
in ext-tool.mk.  Is that right?  Will that also work if libgomp doesn't exist?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
