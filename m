From: Ashwin Bihari <abihari@gmail.com>
Date: Wed, 8 Nov 2006 09:56:42 -0500
Subject: [Buildroot] using the buildroot toolchain
In-Reply-To: <4551E847.60606@olografix.org>
References: <4551E847.60606@olografix.org>
Message-ID: <1f11a5490611080656l5aa199bdk96417ee32ddb2ada@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/8/06, Mircha Emanuel `ryuujin` D'Angelo <ryuujin@olografix.org> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi all,
> this is my first post here :)
>
> I built a rootfs using buildroot and it works fine :).
>
> Now, I have to build my own applications and I'm wondering how can I use
> the toolchain created with buildroot.
>
> I know I have the toolchain in {$BUILDROOT}/build_{$arch}/staging_dir/
> but I don't know how I can compile other applications with uClibc.
>
> For example, if I wanna build A-0.0. I export the toolchain path, then I
> go in A-0.0 directory.
>
> And now? I would have to do ./configure, but there is bad cause the
> script is looking on my host and not on my toolchain. I can't chroot in
> toolchain path cause I don't have make and other utility.
>
> I hope someone could explain me... :)
>
> thanks all
> mircha
>
> PS: sorry for my english
>

Mircha,

This isn't as much a Buildroot issue as the usage of cross compiler. Anyway,
what you would do is add the location of the cross compiler to the PATH as
you have. Then when you want to "./configure" your appliation, you should
make sure that you add "--target=<arch>" which will make the application
realize it's been cross compiled and will try to look for the compiler.

Regards

-- 
~ Ashwin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061108/33999575/attachment.html 
