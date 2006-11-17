From: Bernhard Fischer <rep.nop@aon.at>
Date: Fri, 17 Nov 2006 17:09:36 +0100
Subject: [Buildroot] using the buildroot toolchain
In-Reply-To: <1f11a5490611080656l5aa199bdk96417ee32ddb2ada@mail.gmail.com>
References: <4551E847.60606@olografix.org>
	<1f11a5490611080656l5aa199bdk96417ee32ddb2ada@mail.gmail.com>
Message-ID: <20061117160936.GE28121@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 08, 2006 at 09:56:42AM -0500, Ashwin Bihari wrote:
>On 11/8/06, Mircha Emanuel `ryuujin` D'Angelo <ryuujin@olografix.org> wrote:
>>
>>-----BEGIN PGP SIGNED MESSAGE-----
>>Hash: SHA1
>>
>>Hi all,
>>this is my first post here :)
>>
>>I built a rootfs using buildroot and it works fine :).
>>
>>Now, I have to build my own applications and I'm wondering how can I use
>>the toolchain created with buildroot.
>>
>>I know I have the toolchain in {$BUILDROOT}/build_{$arch}/staging_dir/
>>but I don't know how I can compile other applications with uClibc.
>>
>>For example, if I wanna build A-0.0. I export the toolchain path, then I
>>go in A-0.0 directory.
>>
>>And now? I would have to do ./configure, but there is bad cause the
>>script is looking on my host and not on my toolchain. I can't chroot in
>>toolchain path cause I don't have make and other utility.
>>
>>I hope someone could explain me... :)
>>
>>thanks all
>>mircha
>>
>>PS: sorry for my english
>>
>
>Mircha,
>
>This isn't as much a Buildroot issue as the usage of cross compiler. Anyway,
>what you would do is add the location of the cross compiler to the PATH as
>you have. Then when you want to "./configure" your appliation, you should
>make sure that you add "--target=<arch>" which will make the application
>realize it's been cross compiled and will try to look for the compiler.

If you want to use a native compiler on your target (as opposed to a
cross-compiler on your host) then go to "packages" and select "native
toolchain in the target filesystem" (== BR2_PACKAGE_GCC_TARGET=y)
