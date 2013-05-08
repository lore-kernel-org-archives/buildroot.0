From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 08 May 2013 08:01:36 +0200
Subject: [Buildroot] [PATCH v2 2/2] lockdev: add lockdev
In-Reply-To: <20130507210506.GD22338@free.fr>
References: <1367618887-25757-1-git-send-email-spenser@gillilanding.com>
 <1367959620-17176-1-git-send-email-spenser@gillilanding.com>
 <1367959620-17176-2-git-send-email-spenser@gillilanding.com>
 <20130507210506.GD22338@free.fr>
Message-ID: <5189EA40.9090604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/05/13 23:05, Yann E. MORIN wrote:
>> >+define LOCKDEV_INSTALL_TARGET_CMDS
>> >+	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) install
>> >+	ln -sf $(TARGET_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so
>> >+	ln -sf $(TARGET_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.1
> What is the SONAME of the library? You only need to install the library
> to a file named as the SONAME, not any other symlink is required.
>
> But of course, if "development files on target" are selected you need
> the .so symlink (but devel-files-on-target this is deprecated now).

  But aren't these links created automatically by ldconfig in 
target-finalize? For staging it is still needed, of course.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
