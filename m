From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 22:09:42 +0100
Subject: [Buildroot] libgomp.so.1.0.0 not in target image
In-Reply-To: <CABtOAfyZQW+0KxtNF-cv-eFxBBqkMoyKAw1fSLgTN1WA-S8LrA@mail.gmail.com>
References: <CABtOAfzcjFWUVELMn0X4fRF8fcdqBL5HsBzo7sw1wt8JJc+Ghw@mail.gmail.com>
 <50A284A8.9070304@mind.be>
 <CABtOAfyZQW+0KxtNF-cv-eFxBBqkMoyKAw1fSLgTN1WA-S8LrA@mail.gmail.com>
Message-ID: <50A2B716.1070803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/12 21:55, Alexander Khryukin wrote:
>
>
> 2012/11/13 Arnout Vandecappelle <arnout at mind.be <mailto:arnout@mind.be>>
>
>     On 13/11/12 16:30, Alexander Khryukin wrote:
>
>         Hello.
>         I'm built rpm5 package but when i trying to run it i see
>
>         [root at localhost rpm]# rpmbuild
>         rpmbuild: error while loading shared libraries: libgomp.so.1: cannot open shared object file: No such file or
>         directory
>
[snip]
>
>       Alexander, you are using a recent external Linaro toolchain, right?
>
>       Thomas, I think this should be fixed by adding libgomp to LIB_EXTERNAL_LIBS
>     in ext-tool.mk.  Is that right?  Will that also work if libgomp doesn't exist?
>
[snip]
>
> I'm using own toolchain but it based on linaro
> also linaro toolchain affected too

  But still as an external toolchain, right?  Ouch, now I see crosstool-ng has the
same problem...  But an internal toolchain should work, I think.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
