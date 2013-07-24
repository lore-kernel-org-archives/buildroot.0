From: Woody Wu <narkewoody@gmail.com>
Date: Wed, 24 Jul 2013 21:34:11 +0800
Subject: [Buildroot] Failed building DirectFB
In-Reply-To: <51EFA6CD.9090005@imgtec.com>
References: <20130724091011.GB11352@zuhnb712.ap.bm.net>
 <CAAXf6LXxkj=68rHGDt6yYnB5h4r7hT5JkV9fXhau3kAaDemQSg@mail.gmail.com>
 <20130724095703.GA391@zuhnb712.ap.bm.net>
 <51EFA6CD.9090005@imgtec.com>
Message-ID: <CAAsE_uchPX7Bzbhd7NjkUe-Vyf-JwpeSj=pfsbpWm8bYZNNnjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What's the buildroot it refer to? It's older or newer than 2013.05?  Do you
think I can modify the .mk file similar to what the patch did?  Thanks.


On 24 July 2013 18:05, Markos Chandras <Markos.Chandras@imgtec.com> wrote:

> Hi
>
>
>
>> Understood. Now I enabled imlib2.  But, then I got other errors:
>>
>> mkdir .libs/**libidirectfbimageprovider_**mpeg2.a.tmp
>> (cd .libs/**libidirectfbimageprovider_**mpeg2.a.tmp &&
>> /home/woody/src/buildroot-**2013.05/output/host/usr/bin/**arm-none-linux-gnueabi-ar
>> x ../../.libs/**libidirectfbimageprovider_**mpeg2.a)
>> /home/woody/src/buildroot-**2013.05/output/host/usr/bin/**arm-none-linux-gnueabi-ld
>> -o libidirectfbimageprovider_**mpeg2.o -r .libs/**
>> libidirectfbimageprovider_**mpeg2.a.tmp/*.o
>> rm -f .libs/**libidirectfbimageprovider_**mpeg2.a.tmp/*.o && rmdir .libs/
>> **libidirectfbimageprovider_**mpeg2.a.tmp
>>    CCLD   libidirectfbimageprovider_**imlib2.la<http://libidirectfbimageprovider_imlib2.la>
>> /home/woody/src/buildroot-**2013.05/output/host/opt/ext-**
>> toolchain/bin/../lib/gcc/arm-**none-linux-gnueabi/4.6.3/../..**
>> /../../arm-none-linux-gnueabi/**bin/ld: warning: library search path
>> "/usr/lib" is unsafe for cross-compilation
>> /usr/lib/libImlib2.so: could not read symbols: File in wrong format
>> collect2: ld returned 1 exit status
>> make[5]: *** [libidirectfbimageprovider_**imlib2.la<http://libidirectfbimageprovider_imlib2.la>]
>> Error 1
>>
>
> This is because it picks the imlib2-config on the host instead of the one
> in the staging directory. This has been fixed here
>
> http://git.buildroot.net/**buildroot/commit/package/**
> directfb/directfb.mk?id=**88378877273829c387f48a6c969597**12b892856f<http://git.buildroot.net/buildroot/commit/package/directfb/directfb.mk?id=88378877273829c387f48a6c96959712b892856f>
>
> but it's not in the release you are using.
>
>
> ______________________________**_________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/**mailman/listinfo/buildroot<http://lists.busybox.net/mailman/listinfo/buildroot>
>



-- 
Life is the only flaw in an otherwise perfect nonexistence
    -- Schopenhauer

narke
public key at http://subkeys.pgp.net:11371 (narkewoody at gmail.com)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130724/fb366f64/attachment.html>
