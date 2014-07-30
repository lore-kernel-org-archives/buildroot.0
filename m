From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Jul 2014 19:58:48 +0200
Subject: [Buildroot] [PATCH 0 of 7] Introduction of kconfig-package
	infrastructure
In-Reply-To: <20140729235208.674744cc@free-electrons.com>
References: <patchbomb.1406224167@localhost>
 <20140729235208.674744cc@free-electrons.com>
Message-ID: <CAAXf6LV3P+qJGK11q9eGYtT+tJOMt4HGC3mou+86ch-PpVD64g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 29, 2014 at 11:52 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 24 Jul 2014 19:49:27 +0200, Thomas De Schampheleire wrote:
>
>> This patch series introduces a kconfig-package infrastructure and already
>> converts the uclibc and busybox packages.
>> The series is based on the to-be-applied uclibc patch series that improves the
>> behavior of the kconfig parts.
>
> Weird, you don't have the summary of patches in the cover letter. Don't
> you use 'git --cover format-patch' to generate the cover letter?

Is this a trick question? ;-)
I'm using mercurial to send out patches, unfortunately it does not
have a ready-made option to get this summary of patches. I have wanted
to do that in the past too, so I'll write a little script to mimic the
output of git here.

>
> Anyway:
>
>  * I've applied two preparation patches of this series:
>    uclibc: use $(MAKE) iso $(MAKE1) for menuconfig target
>    linux: remove support of linux26-* targets
>
>    This way, you don't have to carry them anymore.

Thanks!

>
>  * Regarding the kconfig-package infra stuff, I'm mostly fine with it,
>    except for one detail: it pretends to be a package infrastructure,
>    but it is not. It is only a kind of "library" / "helper" to use next
>    to a real package infrastructure. And I think this is pretty
>    confusing considering the name that was chosen, and the way it works.
>
>    My proposal would therefore be to turn it into a real package
>    infrastructure by simply making it inherit from generic-package,
>    much like autotools-package, cmake-package and al. All kconfig-based
>    packages are otherwise generic-package. I don't see the logic behind
>    using Kconfig for an autotools-based or cmake-based package, since
>    autotools and cmake are precisely here to provide configuration
>    capabilities that overlap with what kconfig provides. And as of
>    today, we have linux, barebox, uclibc and busybox, and all of these
>    use the generic-package infra.

I never thought of it this way, but what you say makes perfect sense to me.

>
>    I think it's really a minor change in the patches, and with this
>    change, I'm willing to merge this package infra.

Great! I'm on it, hope to send out the adapted series soon...

Best regards,
Thomas
