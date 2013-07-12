From: Jan Pohanka <xhpohanka@gmail.com>
Date: Fri, 12 Jul 2013 12:56:00 +0200
Subject: [Buildroot] packages build order and dependencies
Message-ID: <51DFE0C0.6010307@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I would like to clarify myself how the order of the package build is 
defined. I thought that when I specify the package dependency in 
Kconfig, then the top one should be built first. But it seems that I 
need also it to add MY_PACKAGE_DEPENDENCIES variable in mk file. Am I right?

Like this example
# Kconfig
config MY_PACKAGE
     bool "my_package"
     depends on BR2_LINUX_KERNEL


#my_package.mk
...
#is this needed for building linux before my_package?
MY_PACKAGE_DEPENDENCIES += linux
...

best regards
Jan
