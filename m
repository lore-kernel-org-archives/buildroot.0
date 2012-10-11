From: Alexander Khryukin <alexander@mezon.ru>
Date: Fri, 12 Oct 2012 02:27:04 +0400
Subject: [Buildroot] rpm5
In-Reply-To: <507744C6.6010303@mind.be>
References: <1349695691.6518.2.camel@localhost> <50748D38.6000101@mind.be>
 <CABtOAfzoOqrjf83+caK4moJc26RsKEfvej2rOBS0ma2vw8-fpQ@mail.gmail.com>
 <507744C6.6010303@mind.be>
Message-ID: <CABtOAfwz7TLgP5qf6HKhFnK-isC92GRxgjTjLM9VsW_B5xYrxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/12 Arnout Vandecappelle <arnout@mind.be>

> On 10/10/12 16:40, Alexander Khryukin wrote:
> [snip]
>
>> config.log
>>
>> http://pastebin.com/L5CLKg06
>>
>
> /home/user/buildroot/output/**host/usr/arm-buildroot-linux-**
> gnueabi/sysroot/usr/lib/**libbeecrypt.so: undefined reference to
> `GOMP_parallel_sections_start'
>
>
>  Your cross-toolchain seems to contain OpenMP support.  Either add
> --disable-openmp to BEECRYPT_CONF_OPT, or if you really need OpenMP support
> in beecrypt, add LIBS=-lgomp to RPM_CONF_ENV.
>
>
>  Maybe we should just add --disable-openmp to BEECRYPT_CONF_OPT?
>
>
>
>  Regards,
>  Arnout
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>

I wrote a simple patch that enables support of -lgomp instead of $LIB_GOMP
macro
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121012/37c7a58a/attachment-0001.html>
