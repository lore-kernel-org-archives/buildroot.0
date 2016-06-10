From: Mickael Chazaux <mickael.chazaux@gmail.com>
Date: Fri, 10 Jun 2016 13:00:38 +0200
Subject: [Buildroot] [PATCH 0/1] RFC: Proper way of adding Apache modules
Message-ID: <1465556439-60344-1-git-send-email-mickael.chazaux@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here is a simple module for the Apache web server. The build process
uses a tool, apxs, that builds the module. But it seems its configuration 
file, output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/build/config_vars.mk
is not quite right as the install steps failed. I worked around by calling
libtool --install directly from the apache-mod-auth-tkt.mk file.

I have another module to build that is more complicated, mod_fcgid. This one
will not build with apxs configured the way it is. 

In my old openembedded environment, I unpacked the mod_fcgid directly inside
the apache source tree and built all from there, simply adding fcgid to
the apache --enable-mods-shared= configure option.

What should I do in buildroot?

Mickael Chazaux (1):
  Apache mod_auth_tkt : new package

 package/Config.in                                  |  1 +
 package/apache-mod-auth-tkt/Config.in              |  5 ++++
 package/apache-mod-auth-tkt/apache-mod-auth-tkt.mk | 31 ++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/apache-mod-auth-tkt/Config.in
 create mode 100644 package/apache-mod-auth-tkt/apache-mod-auth-tkt.mk

-- 
2.1.4
