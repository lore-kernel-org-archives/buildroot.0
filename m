From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 22:21:19 +0100
Subject: [Buildroot] libgomp.so.1.0.0 not in target image
In-Reply-To: <201211132219.14720.yann.morin.1998@free.fr>
References: <CABtOAfzcjFWUVELMn0X4fRF8fcdqBL5HsBzo7sw1wt8JJc+Ghw@mail.gmail.com>
 <CABtOAfyZQW+0KxtNF-cv-eFxBBqkMoyKAw1fSLgTN1WA-S8LrA@mail.gmail.com>
 <50A2B716.1070803@mind.be> <201211132219.14720.yann.morin.1998@free.fr>
Message-ID: <50A2B9CF.9010007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/12 22:19, Yann E. MORIN wrote:
> Arnout, All,
>
> On Tuesday 13 November 2012 Arnout Vandecappelle wrote:
>>> On 13/11/12 16:30, Alexander Khryukin wrote:
>>>> I'm built rpm5 package but when i trying to run it i see
>>>>
>>>> [root at localhost rpm]# rpmbuild
>>>> rpmbuild: error while loading shared libraries: libgomp.so.1: cannot open shared object file: No such file or
>>>> directory
> [--SNIP--]
>> But still as an external toolchain, right?  Ouch, now I see crosstool-ng has the
>> same problem...  But an internal toolchain should work, I think.
>
> In crosstool-NG, libgomp is not automatically built. There is a config
> knob to enable/disable build of libgomp (the default is not to build it).

  Yes, it's also not built by default in the internal toolchain.  But if it is
built, then libgomp.so should be installed in $(TARGET_DIR) - and currently it
isn't.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
