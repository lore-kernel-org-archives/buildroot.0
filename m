From: David Sanchez Herrero <david.krusty@gmail.com>
Date: Mon, 3 Sep 2012 08:20:35 +0200
Subject: [Buildroot] Problems building Busybox 1.20.1 with Buildroot
	2012.05
In-Reply-To: <5043BD15.4020709@mind.be>
References: <CAMPeO9x61f+1fU+qdOTQav3MEbqZRG8X2SR+WLjeQgHRWxsC4A@mail.gmail.com>
 <5043BD15.4020709@mind.be>
Message-ID: <CAMPeO9x1N0j3c4DiRwkHdA7erFg8Q2TfVAUS0bEyAQY=_ZQvBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

That was exactly the problem. I have set the values:

UCLIBC HAS_RESOLVER_SUPPORT=y
UCLIBC_HAS_LIBRESOLV_STUB=y

With these options, everything builds fine.

Thanks all for your help.

Greetings, David.

2012/9/2 Arnout Vandecappelle <arnout@mind.be>

> On 09/02/12 20:06, David Sanchez Herrero wrote:
>
>> Hi all,
>>
>> I'm trying to build a Buildroot toolchain using configuration files for
>> Buildroot and uClibc downloaded from the
>> official forum.
>>
>> During the full building process with Buildroot, I get the next error in
>> Busybox building, and I'm blocked there:
>>
> [snip]
>
>  networking/lib.a(nslookup.o): In function `nslookup_main':
>> nslookup.c:(.text.nslookup_**main+0x2c): undefined reference to
>> `__res_init'
>> nslookup.c:(.text.nslookup_**main+0x54): undefined reference to
>> `__res_state'
>> nslookup.c:(.text.nslookup_**main+0x78): undefined reference to
>> `__res_state'
>> nslookup.c:(.text.nslookup_**main+0x8c): undefined reference to
>> `__res_state'
>>
>
>  Any chance you have a custom uClibc config, which doesn't have
> HAS_LIBRESOLV_STUB ?
> Try with the default uClibc config from buildroot (don't forget to make
> clean).
>
>  If that doesn't help, please run 'make savedefconfig' and post the
> resulting
> defconfig, so we can try to reproduce the problem.
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
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120903/5498dba5/attachment.html>
