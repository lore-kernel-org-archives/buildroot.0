From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 24 Jul 2013 11:30:12 +0200
Subject: [Buildroot] Failed building DirectFB
In-Reply-To: <20130724091011.GB11352@zuhnb712.ap.bm.net>
References: <20130724091011.GB11352@zuhnb712.ap.bm.net>
Message-ID: <CAAXf6LXxkj=68rHGDt6yYnB5h4r7hT5JkV9fXhau3kAaDemQSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 24, 2013 at 11:10 AM, Woody Wu <narkewoody@gmail.com> wrote:
> Hi,
>
> I enabled DirectFB in buildroot-2013.05.  My toolchain is the Sourcery
> CodeBench selected from the buildroot toolchain menu.
>
> Now I got a compile error:
>
>
> make[5]: Leaving directory `/home/woody/src/buildroot-2013.05/output/build/directfb-1.6.3/interfaces/IDirectFBImageProvider/mpeg2'
> make[5]: Entering directory `/home/woody/src/buildroot-2013.05/output/build/directfb-1.6.3/interfaces/IDirectFBImageProvider'
>   CC     idirectfbimageprovider_dfiff.lo
>   CC     idirectfbimageprovider_gif.lo
>   CC     idirectfbimageprovider_jpeg.lo
>   CC     idirectfbimageprovider_png.lo
>   CC     idirectfbimageprovider_imlib2.lo
>   CC     idirectfbimageprovider_pnm.lo
> idirectfbimageprovider_imlib2.c:64:20: fatal error: Imlib2.h: No such file or directory
> compilation terminated.
>
> Do you have an idea about this? Or, what features I should disable to skip the problem?

It seems that directfb.mk already adds some dependencies to imlib2.
Normally, the imlib headers should be available in
output/staging/usr/include.

Is the imlib2 package already built? It should be present in
output/build/imlib2-...
Did you do anything special?
Can you send your .config file?
Which version of buildroot are you using?

Best regards,
Thomas
