From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Feb 2013 00:26:14 +0100
Subject: [Buildroot] [RFC] Removing CLEAN_CMDS and
 UNINSTALL_(STAGING|TARGET)_CMDS
In-Reply-To: <201302082349.42455.yann.morin.1998@free.fr>
References: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201302082349.42455.yann.morin.1998@free.fr>
Message-ID: <20130209002614.5568c197@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 8 Feb 2013 23:49:42 +0100, Yann E. MORIN wrote:

> > That said, it is true that the <pkg>-clean target might be useful for
> > some use cases.
> 
> What about your pending out-of-tree package build? I see it as a very
> easy way to clean a package: remove the build-dir altogether. Thus, we
> still have the ability to '-clean' a package, whithout a requirement
> on the package to provide any _CMDS for it.

Agreed. If we have a infrastructure-based way of supporting make
<foo>-clean, then I'm all for it. But as you say, it still means that
the <pkg>_CLEAN_CMDS would no longer exist.

> > However, is <pkg>-uninstall really useful, considering
> > that it doesn't take into account the removal of the reverse
> > dependencies?
> 
> Not easily doable, so probably error-prone on the user side. However,
> how many issues have been reported on this? I guess the volume was has
> been pretty low, so either users do not use it, or are not aware of it,
> or expect it to break and manually ensure coherency.
> 
> For the two first categories, they won't miss it if/when we remove it.
> For the latter category, I doubt they are many, so will probably not
> whine too much if/when we remove it.

The main problem I see with <pkg>_UNINSTALL_..._CMDS is that we have
never been asking for them when reviewing packages. Sometimes new
packages have them, sometimes not. And I haven't seen any of these
commands being updated/fixed in any package, which to me is an
indication that nobody uses them in practice.

> My stance on the subject is:
>   - pkg-clean can be achieved in a better, safer, more systematic way
>     with your out-of-tree package build, so we can/should remove any
>     _CLEAN_CMDS;
>   - pkg-uninstall is inherently broken, and there is no easy, sustainable
>     way to implement it, so we can/should remove it.

I agree with your summary.

Thanks for this feedback,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
