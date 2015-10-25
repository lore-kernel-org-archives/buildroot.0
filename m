From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 25 Oct 2015 20:21:07 +0100
Subject: [Buildroot] [PATCH v5 02/36] package/libevas-generic-loaders:
 move to package directory
In-Reply-To: <20151025125624.GD3665@free.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-3-git-send-email-romain.naour@openwide.fr>
 <20151025125624.GD3665@free.fr>
Message-ID: <562D2BA3.9020203@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 25/10/2015 13:56, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
>> As for expedite package, there is no advantage for efl related
>> packages to share the same version number anymore
>> (except for efl and libelementary).
>>
>> Also, we usually do not have a sub-directory for a family of related
>> packages which doen't share the same version number, so move
>> libevas-generic-loaders to package directory.
>> Libevas-generic-loaders appear now in "Libraries" -> "Graphics" in
>> the Kconfig menu.
>>
>> While at it, remove BR2_USE_WCHAR dependency since the efl package
>> already depend on it.
> 
> Are you sure that libevas-generic-loaders does not itself depend on
> wchar?
> 
> If it does, then please keep the dependency, even if it is automatically
> inherited through the dependency on EFL. This is so, in case EFL loses
> its dependency on wchar, libevas-generic-loaders would still have its
> own.

libevas-generic-loaders doesn't use wchar by itself, it's a reverse dependency
that come from librsvg which is required for svg support only.

So, IIUC when a package A select a package B, we must propagate all reverse
dependencies of the package B when the package A already depends on them
implicitly (i.e when using a depends on BR2_PACKAGE_C).

Also, in the libevas-generic-loaders bump I removed two other dependencies for
the same reason (BR2_TOOLCHAIN_HAS_THREADS and BR2_INSTALL_LIBSTDCPP):
http://lists.busybox.net/pipermail/buildroot/2015-October/142950.html

Thoughts ?

Best regards,
Romain
> 
> If it is not needed, then:
> 
>     Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Regards,
> Yann E. MORIN.
> 
