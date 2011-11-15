From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2011 22:28:19 +0100
Subject: [Buildroot] RFC: package patching
In-Reply-To: <201111151914.38517.arnout@mind.be>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <87k471n59k.fsf@macbook.be.48ers.dk>
 <201111151914.38517.arnout@mind.be>
Message-ID: <20111115222819.4dd46e3b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 15 Nov 2011 19:14:38 +0000,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> > Yes, I know - We hit this with E.G. busybox in the past. I would go
> > for the versioned-patches-in-subdir, as we (luckily) only support
> > multiple versions for a limited number of packages.
> 
>  While we're at it, I would also make it policy to not include the
> version number in the patch, except for packages with multiple active
> versions.  Now, when you're upgrading a package, you also have to do
> a lot of renames of patches.

I agree with both Thomas and Arnout. Thomas is right on the fact that
we should clarify the patching logic in the package infrastructure, but
this clarification should also come together with a clarification of
the best practices for storing patches for packages.

As Arnout suggests, I think that most packages should just have patches
whose filename do not contain the version. Only packages that support
multiple versions would have subdirectories.

At the same time, we should also probably generalize the usage of patch
numbering, in order to have a clear order of the patches. I.e,
something such as:

	foobar-0001-something.patch
	foobar-0002-somethingelse.patch

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
