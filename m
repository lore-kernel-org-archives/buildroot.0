From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2011 11:00:16 +0200
Subject: [Buildroot] [PATCH 05/12] package: implement a 'local' site
 method
In-Reply-To: <CAAXf6LVq=6i-D6N2n1u0mAzEKufBMhXRaq5FaY=tSfa12jE0pA@mail.gmail.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
 <867549f5fef1c44afbe437119feac731f6757833.1311141087.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LVGd8MQaLLjeEbz4e4gENwYV_gCN7SxS1N6ugjWvAdunw@mail.gmail.com>
 <20110720201942.17ec130a@skate>
 <CAAXf6LUCODt7jvwhN7iFogCrH0F6isiszDJ=6710-Uu=kVz+sA@mail.gmail.com>
 <20110725091116.1655460c@skate>
 <CAAXf6LVq=6i-D6N2n1u0mAzEKufBMhXRaq5FaY=tSfa12jE0pA@mail.gmail.com>
Message-ID: <20110725110016.76f0fef0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 25 Jul 2011 10:42:36 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> > Do you see any other option ?
> 
> I agree that copying the source tree is out of the question.
> 
> If the unionfs trick does indeed add a dependency to the host-kernel
> configuration (which is undesirable in my opinion),

I guess most current distros have a kernel that support this, but I'm
not sure we want to rely on such a non-standard mechanism.

> then using a per-package indication about whether it supports out-of-tree 
> building could be helpful. I mentioned it in the other thread.
> 
> For those packages that do not support it, too bad, compilation from
> multiple buildroot installations wouldn't work. If someone requires
> this, he'll have to make a copy of the local package himself, or make
> sure the package's out-of-tree building gets supported.

I don't like the idea of having a different behaviour for different
packages. The whole purpose of the package infrastructures was to
standardize the build process/behavior of all packages. So adding a
feature that makes different packages behave differently is not
something I would really be happy with.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
