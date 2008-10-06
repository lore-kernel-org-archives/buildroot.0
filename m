From: suffecool at comcast.net <suffecool@comcast.net>
Date: Mon, 06 Oct 2008 17:54:23 +0000
Subject: [Buildroot] buildroot not listening to my project linux config file
Message-ID: <100620081754.11188.48EA50CF0004169800002BB422058860140401010C0A00009A9C@comcast.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have saved my project config files using "make saveconfig", once I had all my configuration set for my project.
My project name is "samdev", so this copied the four config files into buildroot/local/samdev.
The "master" buildroot config file has the following final three lines:

% tail -n 3 ./local/samdev/samdev.config
BR2_PACKAGE_LINUX_KCONFIG="./local/samdev/linux-2.6.24.config"
BR2_PACKAGE_BUSYBOX_CONFIG="./local/samdev/busybox-1.12.1.config"
BR2_UCLIBC_CONFIG="./local/samdev/uclibc-0.9.29.config"

I then did a clean so I could test my saved config, and ran "make BOARD=samdev".
Once everything was compiled, I noticed that although uClibc and busybox were compiled correctly, the kernel was not.  In other words:

./local/samdev/uclibc-0.9.29.config matched the config file ./toolchain_build_arm/uClibc-0.9.29/.config

./local/samdev/busybox-1.12.1.config matched the config file ./project_build_arm/samdev/busyboy-1.12.1/.config

but

./local/samdev/linux-2.6.24.config did NOT match the config file ./project_build_arm/samdev/linux-2.6.24/.config

I'm not sure where the linux kernel got its .config file from, but it certainly wasn't the one I specified.

If this is a make error, I guess I'll submit a bug report.
If it is user error, please enlighten me on what I am doing wrong.
Thanks.

--Kevin S.
