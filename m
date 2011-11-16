From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 16 Nov 2011 07:44:54 +0100
Subject: [Buildroot] RFC: package patching
In-Reply-To: <20111115222819.4dd46e3b@skate>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <87k471n59k.fsf@macbook.be.48ers.dk>
 <201111151914.38517.arnout@mind.be> <20111115222819.4dd46e3b@skate>
Message-ID: <CAAXf6LVgWfk4SeocyimX6qZXLjB5sBhj3i+igAOenBEF9v1t3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 15, 2011 at 10:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Tue, 15 Nov 2011 19:14:38 +0000,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>> > Yes, I know - We hit this with E.G. busybox in the past. I would go
>> > for the versioned-patches-in-subdir, as we (luckily) only support
>> > multiple versions for a limited number of packages.
>>
>> ?While we're at it, I would also make it policy to not include the
>> version number in the patch, except for packages with multiple active
>> versions. ?Now, when you're upgrading a package, you also have to do
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

I'm not sure if this is so black-and-white. If a patch backports a
change from 1.2.3 to 1.2.2, then IMO the patch should really be named
1.2.2, even if only 1.2.2 is present in Buildroot. If it is named
without version, then it will also be taken along when bumping the
package (and possibly but not necessarily cause a patch conflict).
Only in cases were the change made by the patch is generic and not
intended for a specific version, should we remove the version from the
patch name.

>
> At the same time, we should also probably generalize the usage of patch
> numbering, in order to have a clear order of the patches. I.e,
> something such as:
>
> ? ? ? ?foobar-0001-something.patch
> ? ? ? ?foobar-0002-somethingelse.patch
>

Ok with me.

Best regards,
Thomas
