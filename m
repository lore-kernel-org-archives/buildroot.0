From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jun 2010 22:15:48 +0200
Subject: [Buildroot] [pull request] Pull request for branch linux-cleanup
In-Reply-To: <20100620212248.73b3804a@surf>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<20100620153716.63b1ff25@surf> <20100620155140.78e57e4a@surf>
	<874ogxa8wj.fsf@macbook.be.48ers.dk> <20100620212248.73b3804a@surf>
Message-ID: <20100622221548.71717b3a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Jun 2010 21:22:48 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Ah, ok, I misunderstood. Fixed in my tree, will be part of the next
> push. I'll let you know when it's ready.

The next (and hopefully final) push has been made. Changes since the
last one :

 * Do not touch the OABI_COMPAT kernel option

 * At compile time do :
	make <image-type>
	if modules:
		make modules

   At install time do :
	cp <image-path> $(BINARIES_DIR)
	if modules:
		make modules_install

   At initramfs regeneration time do :
	make <image-type>

 * Minor Config.in improvements (tabulations, help texts, etc.)

As usual, available in the linux-cleanup branch at
git://git.busybox.net/~tpetazzoni/git/buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
