From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2011 09:11:16 +0200
Subject: [Buildroot] [PATCH 05/12] package: implement a 'local' site
 method
In-Reply-To: <CAAXf6LUCODt7jvwhN7iFogCrH0F6isiszDJ=6710-Uu=kVz+sA@mail.gmail.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
 <867549f5fef1c44afbe437119feac731f6757833.1311141087.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LVGd8MQaLLjeEbz4e4gENwYV_gCN7SxS1N6ugjWvAdunw@mail.gmail.com>
 <20110720201942.17ec130a@skate>
 <CAAXf6LUCODt7jvwhN7iFogCrH0F6isiszDJ=6710-Uu=kVz+sA@mail.gmail.com>
Message-ID: <20110725091116.1655460c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 24 Jul 2011 16:50:50 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Ok, I was indeed confusing the two.
> If I understand correctly, the main difference is that the file method
> expects an archive, and the local method expects a prepared source
> tree.

Right.

> But this also means that you cannot properly use a 'local' package
> from two buildroot installations, since the compilation process
> happens in the local directory. Is that correct?

Yes, this is unfortunately correct. The only other options would be :

 * Do the build out-of-tree, but this is already been discussed in
   another thread as being highly problematic for many packages ;

 * Make a copy of the complete source tree. This is reasonable for
   small projects, but for example, for something like the kernel, it
   is largely unreasonable, and one of the packages for which the
   "source override" mechanism is the most interesting is the kernel
   package.

Do you see any other option ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
