From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Oct 2012 22:05:25 +0200
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <201210172147.15828.yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <507CF328.5090505@mind.be> <20121017213040.01b61869@skate>
 <201210172147.15828.yann.morin.1998@free.fr>
Message-ID: <20121017220525.6e7e173b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, 17 Oct 2012 21:47:15 +0200, Yann E. MORIN wrote:

> Maybe the solution would be that we do not add _AVAILABLE to
> sub-options, but we can still use it from sub-options. Eg.
> (condensed):
> 
>     config PKG_FOO_AVAIL
>         def_bool y
>         depends on blabla
> 
>     config PKG_FOO
>         bool "package foo"
>         depends on PKG_FOO_AVAIL
>         select blabla
> 
>     config PKG_BAR_AVAIL
>         def_bool y
>         depends on booboo
> 
>     config PKG_BAR
>         bool "package bar"
>         depends on PKG_BAR_AVAIL
>         select booboo
> 
>     if PKG_BAR
> 
>     config PKG_BAR_OPTION
>         bool "bar's option"
>         depends on PKG_FOO_AVAIL
>         select PKG_FOO
> 
>     comment "bar's option needs package foo"
>         depends on !PKG_FOO_AVAIL
> 
>     endif # PKG_BAR
> 
> Isn't that sufficient?

From a quick review, it sounds sufficient indeed. What surprises me is
why we didn't think about this solution the other day when discussing
your _AVAILABLE patch set.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
