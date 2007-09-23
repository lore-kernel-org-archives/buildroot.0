From: Roderick Taylor <myopiate@gmail.com>
Date: Sun, 23 Sep 2007 13:30:43 +1000
Subject: [Buildroot] this commit breaks x86_64 toolchain builds
In-Reply-To: <20070921093101.GD24467@aon.at>
References: <e83232070709060559u27a12f78u1ddb96d7c4d7bc20@mail.gmail.com>
	<20070907131447.GD17733@aon.at>
	<e83232070709101445l7db6927dx8a166ef8e9db8572@mail.gmail.com>
	<20070911183533.GD20058@aon.at>
	<e83232070709120554h3d995dfdwbc055e701b271f80@mail.gmail.com>
	<20070921093101.GD24467@aon.at>
Message-ID: <e83232070709222030v4f3a63bbp682ce0a711745730@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> We will have to retain the lib/ vs. lib64/ layout for multilib anyway.

I dont' use Debian but from what I've read when investigating the
original problem, it doesn't use this directory scheme, it uses lib
and lib32. Thats how I come across this patch.  I'm not sure how
changing multilib directories will break support for it.  I'd say it
would only be broken if something that is built later on in buildroot
was hardcoded to use the lib64 directory, or you wanted to use a
32-bit proprietary program that expects libraries are in lib.  But
which is broken?  The directory structure or the thing that depends
upon it?

http://www.redhat.com/magazine/009jul05/features/multilib/

> to). Look at BR2_MULTILIB.

You mean BR2_ENABLE_MULTILIB.

x86_64 builds of GCC-4.2.1 puts the 64-bit libraries into /lib64 even
if you disable multilib.
