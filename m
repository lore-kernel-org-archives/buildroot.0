From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jul 2011 09:46:38 +0200
Subject: [Buildroot] how BR download the linux kernel now
In-Reply-To: <CAAa76NSqWgSvUZEgtpCGvk-Ly69P9wdfSoWz1q2XC=-y7EtKFg@mail.gmail.com>
References: <CAAa76NT59eY9Kbhej2vyk23GBP-ofu5FyApsnHpsgHvSLzZaNQ@mail.gmail.com>
 <201107122259.14014.yann.morin.1998@anciens.enib.fr>
 <CAAa76NSqWgSvUZEgtpCGvk-Ly69P9wdfSoWz1q2XC=-y7EtKFg@mail.gmail.com>
Message-ID: <20110713094638.40cec50c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 12 Jul 2011 18:03:27 -0400,
raymond zhao <raymond.zhao.ml@gmail.com> a ?crit :

> I do not know the initial motive of this movement, but I prefer the
> old approach.

The motivation is to benefit from the common features of the package
infrastructure (git/svn/bzr download, common way of tracking package
construction, etc.)

> The linux kernel is a special "package". Lots of embedded projects
> (if not all of them) will start from a certain version of the kernel
> and hack the kernel from there, such as add device drivers etc. Then,
> put the source code into a local git server to do version control.
> Some people argued to use original tarball plus the patch, but it
> makes the development procedure very painful. In the old approach, it
> is very easy to hack the linux.mk to checkout the kernel source code
> directly into the output directory. But, in the new one. Looks it
> becomes more complex. The kernel is very big. Check out with the git,
> archive it to a tarball, and then extract it to the output directory
> for building will waste lots of time. Is there a official solution
> (or suggestion) for my situation?

Yes, I am currently working on extending the package infrastructure so
that any package (not only the Linux kernel, but any package) can be
sourced from an existing directory, instead of being downloaded through
git/svn/http.

I have already published preliminary versions of this work (see "[RFC]
Override source directories", posted May, 18th 2011), and I intend to
continue. The basic mechanism is working, I still have issues
implementing "make source" and "make external-deps" with this mechanism.

It'd be really nice if you could have a look at what I did to see if it
would solve your use case as well.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
