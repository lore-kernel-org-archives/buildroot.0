From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2011 21:21:21 +0200
Subject: [Buildroot] Add package statserial
In-Reply-To: <BANLkTi=bZM8DpVptAVzw13Xs4V0d7b2rVg@mail.gmail.com>
References: <BANLkTi=bZM8DpVptAVzw13Xs4V0d7b2rVg@mail.gmail.com>
Message-ID: <20110606212121.335044b2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Francis,

Le Mon, 6 Jun 2011 00:03:36 -0300,
Francis Mendes <francis.mendes@gmail.com> a ?crit :

> I needed this package and added it to Buildroot.
> 
> Can anyone review the attached patch for any mistakes?

Thanks for this submission!

It would be nicer to attach the patch inline, as it is easier to make
comments through the patch.

Two comments :

 * You should "select" BR2_PACKAGE_NCURSES instead of "depends on".
   That's the dependency type we use for the dependency of programs on
   libraries.

 * Your statserial-1.1-fixmakefile.patch should have a header with a
   description saying why it is needed, and with a Signed-off-by line.
   From a quick read, I don't see why the patch is needed.

 * Your installation line should be
   $(INSTALL) -D -m 0755 $(@D)/statserial $(TARGET_DIR)/usr/bin/statserial
   otherwise your statserial binary will be named "bin" in
   $(TARGET_DIR)/usr if the usr/bin directory does not exist.

Otherwise, looks good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
