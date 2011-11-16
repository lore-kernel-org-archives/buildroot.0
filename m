From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2011 19:03:06 +0100
Subject: [Buildroot] RFC: package patching
In-Reply-To: <CAAXf6LVgWfk4SeocyimX6qZXLjB5sBhj3i+igAOenBEF9v1t3Q@mail.gmail.com>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <87k471n59k.fsf@macbook.be.48ers.dk>
 <201111151914.38517.arnout@mind.be> <20111115222819.4dd46e3b@skate>
 <CAAXf6LVgWfk4SeocyimX6qZXLjB5sBhj3i+igAOenBEF9v1t3Q@mail.gmail.com>
Message-ID: <20111116190306.6e9596a0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 16 Nov 2011 07:44:54 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> > As Arnout suggests, I think that most packages should just have
> > patches whose filename do not contain the version. Only packages
> > that support multiple versions would have subdirectories.
> 
> I'm not sure if this is so black-and-white. If a patch backports a
> change from 1.2.3 to 1.2.2, then IMO the patch should really be named
> 1.2.2, even if only 1.2.2 is present in Buildroot. If it is named
> without version, then it will also be taken along when bumping the
> package (and possibly but not necessarily cause a patch conflict).
> Only in cases were the change made by the patch is generic and not
> intended for a specific version, should we remove the version from the
> patch name.

A generic patch doesn't exist, a patch is *always* for a specific
version of a source tree. The fact that it might apply on multiple
versions of a given package is just pure luck. Therefore, I don't see
where the distinction between "generic patch" and a "version-specific"
patch is.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
