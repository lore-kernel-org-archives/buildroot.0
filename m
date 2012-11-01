From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 01 Nov 2012 23:40:21 +0100
Subject: [Buildroot] [PATCH 1/7] docs/manual: update 'adding packages'
 with the new _AVAILABLE symbol
In-Reply-To: <201211011721.23581.yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <1347234052-10527-2-git-send-email-yann.morin.1998@free.fr>
 <5091D0B8.6050404@mind.be> <201211011721.23581.yann.morin.1998@free.fr>
Message-ID: <5092FA55.9000800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/01/12 17:21, Yann E. MORIN wrote:
> Arnout, All,
>
> On Thursday 01 November 2012 Arnout Vandecappelle wrote:
>> On 09/10/12 01:40, Yann E. MORIN wrote:
[snip]
>>> +21: ifeq ($(BR2_PACKAGE_LIBFOO_GOO),y)
>>> +22: LIBFOO_DEPENDENCIES += goo
>>> +23: LIBFOO_CONF_OPT += --enable-goo
>>> +24: else
>>> +25: LIBFOO_CONF_OPT += --disable-goo
>>> +26: endif
>>
>>    While you're at it, an automatic enable/disable example would
>> be nice too.
>
> What do you mean by "automatic"?

ifeq ($(BR2_PACKAGE_OPENSSL),y)
LIBFOO_DEPENDENCIES += openssl
LIBFOO_CONF_OPT += --enable-openssl
else
LIBFOO_CONF_OPT += --disable-openssl
endif

>
>>> --- a/docs/manual/adding-packages-directory.txt
>>> +++ b/docs/manual/adding-packages-directory.txt
>>> +* The syntax of the +Config.in+ file is the same as the one for the kernel
>>> +  Kconfig file. The documentation for this syntax is available at:
>>> +  https://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=Documentation/kbuild/kconfig-language.txt[]
>>
>>    http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt
>
> Does this URL always match the latest version in the git tree?

  I'm not sure, but anyway we don't sync with the upstream kconfig very
often either.

>
>>> +1. The +BR2_PACKAGE_LIBFOO_AVAILABLE+ symbol shall +depends on+ any
>>> +other package's +_AVAILABLE+ symbol. It may also depend on any other
>>> +symbol, such as toolchain features, but should not directly depend on
>>> +any package's main symbol.
>>
>>    ... except for _XORG7, _PYTHON, etc.
>
> Well, my opinion (FWIW) is those packages should not be treated
> differently just because they are /big/.
>
> (One of) the goal(s) of _AVAILABLE is to allow the user to say either:
>    - I want this package, enable whatever dependencies are required.
> or:
>    - I need this package, but I have to provide a toolchain that has
>      such and such feature
>
> _AVAILABLE makes that easy.
>
> Then, it's up to the user to understand what pulling-in a package implies.

  I actually agree, but that's not the current reality.

  OTOH, it makes sense to promote the wanted reality in the documentation.

  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
