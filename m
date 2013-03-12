From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Mar 2013 00:41:04 +0100
Subject: [Buildroot] [PATCH] [RFC] Add a LOADADDR= option when building
 uImage
In-Reply-To: <513F93C9.7090206@free.fr>
References: <1362998134-4614-1-git-send-email-julien.boibessot@free.fr>
 <CAKduhStbK-9P4GhALmssGO07TdwX1r1rkfOtdUH6NqaYdHJcfg@mail.gmail.com>
 <513F93C9.7090206@free.fr>
Message-ID: <513FBD10.3070909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/13 21:44, Julien Boibessot wrote:
> Hello Daniel,
>
> On 03/12/2013 09:39 AM, Daniel Price wrote:
>> Julien,
[snip]
>> 2) Should this variable only be exposed for linux versions >= 3.7?
>> 3.7 is when CONFIG_ARCH_MULTIPLATFORM appears.
>
> yes, but I don't know how to do that.
> any idea ?

  That's not currently possible in buildroot. It's impossible to derive 
that automatically at configure time.


>> 3) The description in the help text might not help someone new to this
>> topic (like me).  I would suggest something like:
>>
>> "If your ARM system's kernel is configured via the new (3.7+)
>> multi-architecture support (CONFIG_ARCH_MULTIPLATFORM=y in your linux
>> kernel .config), then it is necessary to specify a kernel load address
>> for the uImage.  This should be a hexadecimal string beginning with
>> 0x.  Example setting: 0x00008000."
>
> yes that's better than mine.
> I'm just trying to figure out how to depend from
> CONFIG_ARCH_MULTIPLATFORM and then I will send a new version of my patch.

  Also not possible, because the kernel configuration is separate from 
the buildroot configuration.


  Having an extensive help text is generally considered sufficient.

  Perhaps the prompt could be a bit more explicit still, e.g. "load 
address (for multi-platform image)" (note that the reference to U-Boot is 
redundant since it's already a dependency).

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
