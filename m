From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 27 Jan 2013 17:08:26 +0100
Subject: [Buildroot] Linux and busybox-configfiles
Message-ID: <510550FA.10502@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

buildroot provides direct calls to the configuration menus for busybox
and linux:

make linux-menuconfig
make busybox-menuconfig

Additionally, there is a linux-savedefconfig make target.

All these save their output in the build directory, so that all changes
get lost when "make clean" is called. Thus I don't think that I am the
only one who has been surprised to notice that "make busybox-menuconfig
&& make clean && make" does not have any effect on busybox's configuration.

I have prepared two patches that save these config files in $(TOPDIR),
where buildroot's own config file lives. After "make clean", these files
are used instead of those named in the buildroot config.

Calling "make xxx-defconfig" removes the saved config files, so that
again the configuration from buildroot's config file is used.

The same issue appears with uClibc, ct-ng and probably others, but I do
not think that many users modify these settings.

If these patches get accepted I will update the documentation, too.

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
