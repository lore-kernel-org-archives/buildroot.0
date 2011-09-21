From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2011 09:58:43 +0200
Subject: [Buildroot] [PATCH 2 of 5] toolchain-external: allow
 downloading a custom toolchain
In-Reply-To: <d181fc061658f56665ec.1316588132@localhost6.localdomain6>
References: <patchbomb.1316588130@localhost6.localdomain6>
 <d181fc061658f56665ec.1316588132@localhost6.localdomain6>
Message-ID: <20110921095843.453ca812@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Sep 2011 08:55:32 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Custom external toolchains currently already have to be extracted by the user.
> This patch adds support for downloading a custom toolchain in the form of a
> tarball, which will be extracted by buildroot.

I like this feature, but I think I'd prefer to clearly separate the
cases of "local custom toolchain" and "remote custom toolchain".

So, in the toolchain choice :

 * All the CodeSourcery toolchains
 * Local custom toolchain
 * Remote custom toolchain

When Local custom toolchain is selected, show :
 * Path of the toolchain
 * Prefix of the toolchain

When Remote custom toolchain is selected, show :
 * URL of the toolchain tarball (please don't split site and source in
   the configuration, we don't do that in any other place in Buildroot,
   and it's really strange for the user to have to split the URL in two
   parts)
 * Prefix of the toolchain

What do you think ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
