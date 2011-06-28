From: Benoit Mauduit <benoit.mauduit@gmail.com>
Date: Tue, 28 Jun 2011 14:07:29 +0200
Subject: [Buildroot] [PATCH] [package/config] Change behaviour of symlink
	.config
Message-ID: <1309262850-11224-1-git-send-email-benoit.mauduit@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch change the bahaviour with .config management.

The default behaviour is modified only if .config is a symbolic link.
In this case, the target pointed by the link will be overwritten, and
the old .config is save to .config.old.

This can be useful when we want to save and use the config file
outside the Buildroot directory.
