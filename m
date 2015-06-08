From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 08 Jun 2015 23:52:40 +0200
Subject: [Buildroot] [PATCH 01/11] package-infra: add helper to build
 kernel modules
In-Reply-To: <20150608214443.GH3590@free.fr>
References: <cover.1433628825.git.yann.morin.1998@free.fr>	<7f37dfb955f969acf85ea5044c1c4020096d2270.1433628825.git.yann.morin.1998@free.fr>	<55760493.1070807@mind.be>
 <20150608214443.GH3590@free.fr>
Message-ID: <55760EA8.1000503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/08/15 23:44, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-06-08 23:09 +0200, Arnout Vandecappelle spake thusly:
>> On 06/07/15 00:20, Yann E. MORIN wrote:
> [--SNIP--]
>>> +# Duplicate that from pkg-generic because we need it now
>>> +ifndef $(2)_MAKE
>>> +  $(2)_MAKE = $(MAKE)
>>> +endif
>>
>>  I don't see why this is needed... The defines below will only be expanded when
>> the rule is executed (otherwise $(PKG) would not even be defined), so the
>> definition from pkg-generic is enough, no?
> 
> Well, I tried to remove it, and it does not work (indetation added by me):

 D'oh, it's actually defined in pkg-autotools, not pkg-generic, but the comment
above confused me. Which in fact makes the comment redundant, because it's not a
redifinition.

 That said, I think it's better like this:

$(2)_MAKE ?= $$(MAKE)


 Regards,
 Arnout

> 
>>>> cryptodev-linux 1.7 Building kernel module(s)
> C /home/ymorin/dev/buildroot/O/build/linux-4.0.4 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=i386
>     INSTALL_MOD_PATH=/home/ymorin/dev/buildroot/O/target CROSS_COMPILE="/home/ymorin/dev/buildroot/O/host/usr/bin/i686-pc-linux-gnu-"
>     DEPMOD=/home/ymorin/dev/buildroot/O/host/sbin/depmod KERNEL_DIR=/home/ymorin/dev/buildroot/O/build/linux-4.0.4
>     PREFIX=/home/ymorin/dev/buildroot/O/target M=/home/ymorin/dev/buildroot/O/build/cryptodev-linux-1.7/. modules
> /bin/sh: C: command not found
> make[1]:
> [/home/ymorin/dev/buildroot/O/build/cryptodev-linux-1.7/.stamp_built]
> Error 127 (ignored)
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
