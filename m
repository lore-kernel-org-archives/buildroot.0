From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 16 Nov 2010 09:23:42 -0500
Subject: [Buildroot] CTRL+C in menuconfig deletes .config
Message-ID: <201011160923.42622.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i dont know why the menuconfig target has this logic:
    @if ! $(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN); then \
        test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
    fi

but it causes severely undesirable behavior.  if i do:
	make menuconfig
	<change some things & save>
	make menuconfig
	<change some things but change my mind and hit CTRL+C>

the build system deletes the .config file.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101116/01daa3ba/attachment.pgp>
