From: Sven Klomp <mail@klomp.eu>
Date: Fri, 12 Feb 2021 10:18:32 +0100
Subject: [Buildroot] GOLANG Compilation Issue: build constraints exclude all
 Go files
Message-ID: <499ade29-7cfb-99d7-280b-46b58359a7f9@klomp.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I created package description to compile Syncthing (see attached files). 
However, compilation always fails with the following error message:

can't load package: package github.com/syncthing/syncthing: build 
constraints exclude all Go files in 
/[...]/build/syncthing-1.13.1/_gopath/src/github.com/syncthing/syncthing

In my initial research I came to the conclusion that it might be related 
to CGO: https://github.com/golang/go/issues/24068

However, activating CGO as mentioned in the buildroot documentation 
(https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_go_packages) 
does not solve my problem.

Any hint would be appreciated.

Sven
-------------- next part --------------
config BR2_PACKAGE_SYNCTHING
	bool "syncthing"
	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
    depends on BR2_TOOLCHAIN_HAS_THREADS

    help
	  Syncthing is a continuous file synchronization program.

	  https://syncthing.net
-------------- next part --------------
# Locally computed:
sha256 f4632a062f75d01629e625ccef9625313f5d371c5f9bee744b0b811d47b92e25 v1.13.1.tar.gz
-------------- next part --------------
A non-text attachment was scrubbed...
Name: syncthing.mk
Type: text/x-makefile
Size: 427 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210212/d9f5c924/attachment.bin>
