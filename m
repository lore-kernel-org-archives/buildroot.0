From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Oct 2012 00:14:30 +0200
Subject: [Buildroot] rpm5
In-Reply-To: <CABtOAfzoOqrjf83+caK4moJc26RsKEfvej2rOBS0ma2vw8-fpQ@mail.gmail.com>
References: <1349695691.6518.2.camel@localhost> <50748D38.6000101@mind.be>
 <CABtOAfzoOqrjf83+caK4moJc26RsKEfvej2rOBS0ma2vw8-fpQ@mail.gmail.com>
Message-ID: <507744C6.6010303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/10/12 16:40, Alexander Khryukin wrote:
[snip]
> config.log
>
> http://pastebin.com/L5CLKg06

/home/user/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libbeecrypt.so: undefined reference to 
`GOMP_parallel_sections_start'


  Your cross-toolchain seems to contain OpenMP support.  Either add --disable-openmp to BEECRYPT_CONF_OPT, or if you 
really need OpenMP support in beecrypt, add LIBS=-lgomp to RPM_CONF_ENV.


  Maybe we should just add --disable-openmp to BEECRYPT_CONF_OPT?


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
