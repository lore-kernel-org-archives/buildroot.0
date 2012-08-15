From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 18:08:48 +0200
Subject: [Buildroot] [PATCH 02/12] microperl: how to test it ?
In-Reply-To: <1345041514-31539-2-git-send-email-francois.perrad@gadz.org>
References: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
 <1345041514-31539-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20120815180848.1e0c3d66@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 15 Aug 2012 16:38:24 +0200,
Francois Perrad <fperrad@gmail.com> a ?crit :

> +ifdef BR2_PACKAGE_MICROPERL_INSTALL_TESTSUITE
> +define MICROPERL_INSTALL_TESTSUITE
> +	$(INSTALL) -m644 -D $(@D)/t/TEST                $(TARGET_DIR)/root/microperl/t/TEST

Isn't this one a script that should be installed 755?

> +	$(INSTALL) -m644 -D $(@D)/t/harness             $(TARGET_DIR)/root/microperl/t/harness
> +	cp -r $(@D)/lib         $(TARGET_DIR)/root/microperl/lib
> +	cp -r $(@D)/t/base      $(TARGET_DIR)/root/microperl/t/base
> +	cp -r $(@D)/t/cmd       $(TARGET_DIR)/root/microperl/t/cmd

Is /root/ really the right place to install this? Isn't
some /usr/share/perl/ or /usr/lib/perl/ a better place?

> +	echo "BEGIN { chdir 't' if -d 't'; @INC = ('../lib', '.'); } 1;" > $(TARGET_DIR)/root/microperl/TestInit.pm

I think I would prefer a TestInit.pm file added in package/microperl/
rather than echo'ing it here.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
