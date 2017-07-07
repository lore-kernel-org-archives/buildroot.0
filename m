From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 7 Jul 2017 08:11:26 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/7] linux-pam: introduce
 BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
In-Reply-To: <20170707095035.0e268fe2@windsurf.lan>
References: <20170707022242.20128-1-casantos@datacom.ind.br>
 <20170707022242.20128-2-casantos@datacom.ind.br>
 <20170707033626.ma6y3kcn7o6vadp6@tarshish>
 <20170707095035.0e268fe2@windsurf.lan>
Message-ID: <2133150840.3993463.1499425886009.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> To: "Baruch Siach" <baruch@tkos.co.il>
> Cc: "Carlos Santos" <casantos@datacom.ind.br>, "Karoly Kasza" <kaszak@gmail.com>, "Ezequiel Garcia"
> <ezequiel@vanguardiasur.com.ar>, buildroot at buildroot.org
> Sent: Friday, July 7, 2017 4:50:35 AM
> Subject: Re: [Buildroot] [PATCH 1/7] linux-pam: introduce BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS

> Hello,
> 
> On Fri, 7 Jul 2017 06:36:26 +0300, Baruch Siach wrote:
> 
>> > diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
>> > index 33e5154..0daffe4 100644
>> > --- a/package/linux-pam/Config.in
>> > +++ b/package/linux-pam/Config.in
>> > @@ -1,9 +1,20 @@
>> > -config BR2_PACKAGE_LINUX_PAM
>> > -	bool "linux-pam"
>> > +# Use this option instead of duplicating the dependencies in each
>> > +# dependent package.
>> > +#
>> > +# If you change these dependencies then update the comment below
>> > +# and the # corresponding ones in other Config.in files.
>> > +#
>> > +config BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
>> > +	bool
>> > +	default y
>> >  	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
>> >  	depends on !BR2_STATIC_LIBS
>> >  	depends on !BR2_TOOLCHAIN_USES_MUSL
>> >  	depends on BR2_USE_MMU # fork()
>> 
>> These are feature dependencies, not arch dependencies, so the config name is
>> misleading. But regardless of that, we want to see this list in all dependent
>> packages, IMO. This allows us to (more) easily see and grep for direct and
>> indirect dependencies. It also makes dependencies comments easier to maintain
>> as you noted.

How would repeating the list in all dependent packages make dependencies
comments *easier* to maintain? I didn't meant to say that.

> Correct: the <foo>_ARCH_SUPPORTS hidden options should really only be
> used for architecture dependencies. So in the list above, that would be
> just BR2_USE_MMU. All the other dependencies are *not* architecture
> dependencies, and we want to repeat them explicitly, because each
> package anyway needs to have a Config.in comment that tells the user
> about such toolchain dependencies.

What could be used instead of <foo>_ARCH_SUPPORTS in cases like this?

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
