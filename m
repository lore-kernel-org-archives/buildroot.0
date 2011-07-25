From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 25 Jul 2011 10:42:36 +0200
Subject: [Buildroot] [PATCH 05/12] package: implement a 'local' site
	method
In-Reply-To: <20110725091116.1655460c@skate>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
 <867549f5fef1c44afbe437119feac731f6757833.1311141087.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LVGd8MQaLLjeEbz4e4gENwYV_gCN7SxS1N6ugjWvAdunw@mail.gmail.com>
 <20110720201942.17ec130a@skate>
 <CAAXf6LUCODt7jvwhN7iFogCrH0F6isiszDJ=6710-Uu=kVz+sA@mail.gmail.com>
 <20110725091116.1655460c@skate>
Message-ID: <CAAXf6LVq=6i-D6N2n1u0mAzEKufBMhXRaq5FaY=tSfa12jE0pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jul 25, 2011 at 9:11 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Sun, 24 Jul 2011 16:50:50 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> Ok, I was indeed confusing the two.
>> If I understand correctly, the main difference is that the file method
>> expects an archive, and the local method expects a prepared source
>> tree.
>
> Right.
>
>> But this also means that you cannot properly use a 'local' package
>> from two buildroot installations, since the compilation process
>> happens in the local directory. Is that correct?
>
> Yes, this is unfortunately correct. The only other options would be :
>
> ?* Do the build out-of-tree, but this is already been discussed in
> ? another thread as being highly problematic for many packages ;
>
> ?* Make a copy of the complete source tree. This is reasonable for
> ? small projects, but for example, for something like the kernel, it
> ? is largely unreasonable, and one of the packages for which the
> ? "source override" mechanism is the most interesting is the kernel
> ? package.
>
> Do you see any other option ?

I agree that copying the source tree is out of the question.

If the unionfs trick does indeed add a dependency to the host-kernel
configuration (which is undesirable in my opinion), then using a
per-package indication about whether it supports out-of-tree building
could be helpful. I mentioned it in the other thread.

For those packages that do not support it, too bad, compilation from
multiple buildroot installations wouldn't work. If someone requires
this, he'll have to make a copy of the local package himself, or make
sure the package's out-of-tree building gets supported.

Best regards,
Thomas
