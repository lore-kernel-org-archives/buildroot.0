From: Sergey Naumov <sknaumov@gmail.com>
Date: Wed, 16 Nov 2011 09:18:42 +0300
Subject: [Buildroot] RFC: package patching
In-Reply-To: <20111115222819.4dd46e3b@skate>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <87k471n59k.fsf@macbook.be.48ers.dk>
 <201111151914.38517.arnout@mind.be> <20111115222819.4dd46e3b@skate>
Message-ID: <CAH3pVZO8niF8VmTW77pu72Jq0s6tRMkgZrFzWwo56a-ubesy-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maybe it is worth to introduce a variable where patches to apply are
mentioned (like in openembedded + bitbake)?
PKGNAME_PATCHES = patch1 patch2 ...  - apply these patches
PKGNAME_PATCHES =                           - do not apply patches
<variable is not specified>                          - default
buildroot behavior

somewhere in GENTARGETS/AUTOTARGETS:
PKGNAME_PATCHES ?= (shell find ...)

but bitbake search pathes in different directories (current, directory
with pkg name, dir with pkgname-version), so this is only a draft.

Sergey Naumov.

2011/11/16, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Tue, 15 Nov 2011 19:14:38 +0000,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>> > Yes, I know - We hit this with E.G. busybox in the past. I would go
>> > for the versioned-patches-in-subdir, as we (luckily) only support
>> > multiple versions for a limited number of packages.
>>
>>  While we're at it, I would also make it policy to not include the
>> version number in the patch, except for packages with multiple active
>> versions.  Now, when you're upgrading a package, you also have to do
>> a lot of renames of patches.
>
> I agree with both Thomas and Arnout. Thomas is right on the fact that
> we should clarify the patching logic in the package infrastructure, but
> this clarification should also come together with a clarification of
> the best practices for storing patches for packages.
>
> As Arnout suggests, I think that most packages should just have patches
> whose filename do not contain the version. Only packages that support
> multiple versions would have subdirectories.
>
> At the same time, we should also probably generalize the usage of patch
> numbering, in order to have a clear order of the patches. I.e,
> something such as:
>
> 	foobar-0001-something.patch
> 	foobar-0002-somethingelse.patch
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
