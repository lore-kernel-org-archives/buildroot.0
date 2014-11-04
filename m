From: Martin Dorwig <dorwig@tetronik.com>
Date: Tue, 4 Nov 2014 08:10:39 +0100
Subject: [Buildroot] tzdata.mk
Message-ID: <8737085.cg8s7E4bRe@z-md-01-lnx.aen.tetronik.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
i am using buildroot-2014.08 and
maybe i found a bug inpackage/tzdata/ tzdata.mk

$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share
cp -a $(HOST_DIR)/usr/share/zoneinfo $(TARGET_DIR)/usr/share/zoneinfo

if $(TARGET_DIR)/usr/share/zoneinfo already exist, cp will create 
$(TARGET_DIR)/usr/share/zoneinfo/zoneinfo and copy the files there

i suggest
$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/zoneinfo
cp -a $(HOST_DIR)/usr/share/zoneinfo/* $(TARGET_DIR)/usr/share/zoneinfo

regards 
Martin
