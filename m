From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2011 09:28:54 +0200
Subject: [Buildroot] [PATCH 1 of 2] linux: add linux-update target to
 save configuration
In-Reply-To: <9c76ca74224570a6b9e8.1316587575@localhost6.localdomain6>
References: <patchbomb.1316587574@localhost6.localdomain6>
 <9c76ca74224570a6b9e8.1316587575@localhost6.localdomain6>
Message-ID: <20110921092854.7382e60c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 21 Sep 2011 08:46:15 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> In analogy to build targets uclibc-update and busybox-update, add linux-update
> that copies the current configuration to the custom configuration file set in
> buildroot.
> This facilitates the work of developers adding support for a specific board
> to buildroot.

Definitely a good thing to have. However:

 * The name if misleading. "linux-update" "busybox-update": one is not
   "updating" Linux or Busybox, but rather copying or updating the
   configuration. So presumably the name of those targets should be
   changed.

 * I don't like the existing behaviour of busybox-update and
   uclibc-update, because they can overwrite the default configuration
   in package/busybox/busybox-xxx.config or
   toolchain/uClibc/uClibc-xxx.config. I think those *-update should
   only take effect if a non-standard configuration file was proposed,
   as you did for the Linux one.

 * For the Linux kernel, I do use savedefconfig, so I'd like to see
   either this "linux-update" thing use savedefconfig, or have a
   separate option that does the same thing as "linux-update" but using
   savedefconfig. Maybe "linux-update-config" and
   "linux-update-minconfig" ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
