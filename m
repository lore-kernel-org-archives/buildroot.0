From: Bernhard Fischer <rep.nop@aon.at>
Date: Mon, 20 Nov 2006 17:42:35 +0100
Subject: [Buildroot] patch: openvpn
In-Reply-To: <20061120153150.GE3065@priv.blacknet.de>
References: <20061120153150.GE3065@priv.blacknet.de>
Message-ID: <20061120164235.GA8032@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 20, 2006 at 04:31:50PM +0100, Goetz Bock wrote:
>Use more recent version:

Applied.

- please put the version into a separate FOO_VERSION:=0815
  variable. Makes updates easier.
- if you update to a new version, then please check if there is stuff
  that we want to disable or enable.
  The 2.0.x series has an --enable-small, for example, that we
  definately want:
$ size usr/sbin/openvpn 
   text    data     bss     dec     hex filename
    316584    1448    1016  319048   4de48 usr/sbin/openvpn
and with --enable-small:
$ size usr/sbin/openvpn 
   text    data     bss     dec     hex filename
    284584    1444    1016  287044   46144 usr/sbin/openvpn

which is still *huge* but a little bit better.

thanks,
>
>Index: package/openvpn/openvpn.mk
>===================================================================
>--- package/openvpn/openvpn.mk  (revision 16570)
>+++ package/openvpn/openvpn.mk  (working copy)
>@@ -6,9 +6,9 @@
> # to enable that within busybox
> #
> #############################################################
>-OPENVPN_SOURCE:=openvpn-1.5.0.tar.gz
>-OPENVPN_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/o
>penvpn/
>-OPENVPN_DIR:=$(BUILD_DIR)/openvpn-1.5.0
>+OPENVPN_SOURCE:=openvpn-2.0.9.tar.gz
>+OPENVPN_SITE:=http://openvpn.net/release/
>+OPENVPN_DIR:=$(BUILD_DIR)/openvpn-2.0.9
> OPENVPN_CAT:=$(ZCAT)
> OPENVPN_BINARY:=openvpn
> OPENVPN_TARGET_BINARY:=usr/sbin/openvpn
>
>
>-- 
>/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
>\ /       (c) 2006 Creative Commons, Attribution-ShareAlike 2.0 de
> X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
>/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
>
