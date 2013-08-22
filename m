From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2013 21:42:18 +0200
Subject: [Buildroot] [PATCH] toolchain: add support for glibc
In-Reply-To: <52153685.6010407@mind.be>
References: <1376847393-12397-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <52153685.6010407@mind.be>
Message-ID: <5216699A.8090800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/08/13 23:52, Arnout Vandecappelle wrote:
> On 18/08/13 19:36, Thomas Petazzoni wrote:
>> +config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>> +    bool "glibc (experimental)"
>> +    depends on BR2_arm    || BR2_armeb    || BR2_aarch64 || \
>> +           BR2_i386   || BR2_mips     || BR2_mipsel  || \
>> +           BR2_mips64 || BR2_mips64el || BR2_powerpc || \
>> +           BR2_sh     || BR2_sh64     || BR2_sparc   || \
>> +           BR2_x86_64
>
>   I though, let's try this patch with some exotic architecture, and guess
> what:
>
>  >>> glibc 2.18 Configuring
> ...
> checking sysdep dirs... configure: error: The sh64 is not supported.
>
>
>   Continuing with sparc...

  sparc wouldn't even build gcc-initial, so I continued with powerpc and 
that at least worked :-)  Given that the two comments I had were minor, 
you can add my

Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
