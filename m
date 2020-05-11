From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 11 May 2020 18:26:12 +0200
Subject: [Buildroot] [PATCH v1] package/qt5base: fix compile for
 aarch64_be
In-Reply-To: <873686pj2a.fsf@dell.be.48ers.dk>
References: <20200510205220.16002-1-ps.report@gmx.net>
 <873686pj2a.fsf@dell.be.48ers.dk>
Message-ID: <20200511182612.3920ace4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Mon, 11 May 2020 17:50:21 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
>
>  > Add patch to fix availability check for storeRGB32FromARGB32PM_neon(), only
>  > available for arm little-endian.
>
>  > Fixes:
>
>  >   - http://autobuild.buildroot.net/results/ab623253a6d988f4ee03d292ee85f3455de2ea25
>
>  >   .obj/qimage_conversions.o: In function `convert_generic(QImageData*, QImageData const*, QFlags<Qt::ImageConversionFlag>)':
>  >   qimage_conversions.cpp:(.text+0x2598): undefined reference to `storeRGB32FromARGB32PM_neon(unsigned char*, unsigned int const*, int, int, QVector<unsigned int> const*, QDitherInfo*)'
>  >   qimage_conversions.cpp:(.text+0x259c): undefined reference to `storeRGB32FromARGB32PM_neon(unsigned char*, unsigned int const*, int, int, QVector<unsigned int> const*, QDitherInfo*)'
>  >   .obj/qimage_conversions.o: In function `convert_generic_inplace(QImageData*, QImage::Format, QFlags<Qt::ImageConversionFlag>)':
>  >   qimage_conversions.cpp:(.text+0x28fc): undefined reference to `storeRGB32FromARGB32PM_neon(unsigned char*, unsigned int const*, int, int, QVector<unsigned int> const*, QDitherInfo*)'
>  >   qimage_conversions.cpp:(.text+0x2900): undefined reference to `storeRGB32FromARGB32PM_neon(unsigned char*, unsigned int const*, int, int, QVector<unsigned int> const*, QDitherInfo*)'
>
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> Committed, thanks.
>
> Don't forget to submit the patch upstream.
>

Yup, done, see [1]...

Regards,
Peter

[1] https://codereview.qt-project.org/c/qt/qtbase/+/299830
