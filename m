From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Mon, 2 Jul 2007 23:38:42 +0700
Subject: [Buildroot] busybox-1.6.1.config is missing in revision 18994
Message-ID: <5d75f4610707020938x1e159a56xb744d8d95900a20c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

buildroot/package/busybox has no file
busybox-1.6.1.config
as of svn revision 18994 so I cannot build the busybox.  I get this:

cp -f   /some/path/buildroot/build_i586/busybox-1.6.1/.config
cp: missing destination file operand after
`/some/path/buildroot/build_i586/busybox-1.6.1/.config'
Try `cp --help' for more information.
make: *** [/some/path/buildroot/build_i586/busybox-1.6.1/.configured] Error 1

I think this is from the line

        cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_DIR)/.config

in the file busybox.mk
