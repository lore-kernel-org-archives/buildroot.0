From: Benedikt Riedel <ben@go-unified.com>
Date: Sat, 18 Apr 2015 16:14:10 +0100
Subject: [Buildroot] Advice on how to build TGT
Message-ID: <003c01d079ea$52d2a8b0$f877fa10$@go-unified.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to get this application into my buildroot to provide and manage
iSCSI targets

http://stgt.sourceforge.net/

 

The package is compiling/installing, however I am not able to run the
service or the binary. 

 

# tgtd

-sh: tgtd: not found

 

 

The config.in is fairly simple: 

 

STGT_VERSION= 1.0.57

STGT_SOURCE = v1.0.57.tar.gz

STGT_SITE = https://github.com/fujita/tgt/archive/

STGT_AUTORECONF = NO

STGT_INSTALL_STAGING = NO

STGT_INSTALL_TARGET = YES

STGT_DEPENDENCIES = uclibc

$(eval $(autotools-package))

 

Any suggestion on what I am missing or an alternative iSCSI target that
works with kernel >3.18 would be appreciated. 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150418/e4cb098e/attachment.html>
