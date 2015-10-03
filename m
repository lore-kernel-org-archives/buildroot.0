From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 17:07:52 +0200
Subject: [Buildroot] [PATCH v8 1/1] package/swupdate: new package
In-Reply-To: <1438375543-28208-1-git-send-email-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Fri, 31 Jul 2015 22:45:43
 +0200")
References: <1438375543-28208-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <871tdc56t3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > swupdate provides a reliable way to update the software on an embedded system.
 > Note that swupdates has a reworked Kbuild/Kconfig system. It has now support
 > for the 'option' and 'env' symbols as well for the 'savedefconfig' target.
 > This makes dependency handling much easier. We're now able to pass which
 > dependencies are available through the environment, as suggested by Arnout
 > Vandecappelle [1].

 > In previous version of this patch we had a configuration setting where all
 > package dependencies except Lua were selected by default. This has changed with
 > v7 as we are now able to pass dependencies to the swupdate build system through
 > the environment. For useful operation swupdate requires a parser which depends
 > by default on libconfig, but can be replaced by a json-c or Lua parser.

 > To provide a reasonable firmware update system we enable the embedded webserver
 > based on mongoose (also see notes about mongoose below), a parser as stated
 > above and a handler for raw NAND or NOR flash.

 > The user can modify this configuration by selecting the appropriate dependencies
 > before running `make swupdate-menuconfig`. The help text contains information
 > about which packages may be of interest for the user.

 > The embedded web server requires a website for proper operation. We install the
 > included website by default, however the user may choose to install a custom
 > website on the post-build scripts.

 > Note, swupdate includes some old versions of mongoose and lsqlite3:
 >   - mongoose is version 3.8 from year 2013
 >   - lsqlite3 is version 0.8 from year 2011

 > Currently, swupdate does not provide a way to replace these with external
 > packages.

 > This patch is based on a WIP version submitted by Romain Naour, commented by
 > Arnout Vandecappelle [2].

 > [1]
 > http://lists.busybox.net/pipermail/buildroot/2015-March/122981.html

 > [2]
 > https://patchwork.ozlabs.org/patch/401270/

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 > Cc: Romain Naour <romain.naour@openwide.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Tested-by: Mike Williams <mike@mikebwilliams.com>
 > ---
 > Changes v7 -> v8:
 > [Romain Naour:
 >   - bump to release 2015.07
 >   - add target (MMU) and toolchain (THREAD) dependencies]
 >   - rewrite commit log

Committed, thanks.

-- 
Bye, Peter Korsgaard
