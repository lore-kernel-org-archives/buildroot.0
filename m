From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Thu, 17 Jan 2013 14:47:47 +0000
Subject: [Buildroot] Problem using Linux kernel archive from Gitorious
Message-ID: <CAJkQPOkYXUAWsJw_1dxsObUbx9bboSsF4+yBz6jKEKKXXhxZfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am configuring Buildroot to use an OMAP-L138/DaVinci CPU. I'd like
to use the Linux kernel version from
http://gitorious.org/linux-davinci/linux-davinci/trees/v3.7-davinci1
which is a specific tag in the git repository.

In Buildroot I set:
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=http://gitorious.org/linux-davinci/linux-davinci/archive-tarball/v3.7-davinci1

The file that is returned has the name "v3.7-davinci1", and it is a
"gzip compressed data, from Unix" according to file.

Gitorious calls it a "tarball" but it's obviously not a tarball.

Unfortunately Buildroot fails because, understandably, the file isn't
a tar archive.

>>> linux custom Extracting
/opt/br/dl/v3.7-davinci1 | tar --strip-components=1 -C
/opt/br/output/build/linux-custom  -xf -
/bin/bash: /opt/br/dl/v3.7-davinci1: Permission denied
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors

Should I add an option to Buildroot to handle gzipped files? Or is
there a better way?

regards,

Aras Vaichas
