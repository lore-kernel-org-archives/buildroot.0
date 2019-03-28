From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 Mar 2019 10:01:14 +0100
Subject: [Buildroot] [PATCH v4 3/6] qt5: Convert packages to qmake infra
In-Reply-To: <ef005123-9731-4e4f-dcae-c9b8bddffb43@andin.de>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
 <20190322183904.22401-4-anaumann@ultratronik.de>
 <fdbdea0d-2526-0e5c-f7dc-4515d6bd0607@mind.be>
 <ef005123-9731-4e4f-dcae-c9b8bddffb43@andin.de>
Message-ID: <f6782f61-0fe3-4359-d539-bac250ebce76@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/03/2019 23:11, Andreas Naumann wrote:
>>> -define QT53D_CONFIGURE_CMDS -??? (cd $(@D); $(TARGET_MAKE_ENV)
>>> $(HOST_DIR)/bin/qmake) -endef - -define QT53D_BUILD_CMDS - $(TARGET_MAKE_ENV)
>>> $(MAKE) -C $(@D) -endef - -define QT53D_INSTALL_STAGING_CMDS -???
>>> $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install -??? $(QT5_LA_PRL_FILES_FIXUP)
>>> -endef - -ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y) -define
>>> QT53D_INSTALL_TARGET_EXAMPLES -??? cp -dpfr
>>> $(STAGING_DIR)/usr/lib/qt/examples/qt3d $(TARGET_DIR)/usr/lib/qt/examples/
>>
>> So, how is the examples case handled now?
> 
> To be honest, I dont know how exactly. But I have tested that if qt5base
> was configured without examples, they wont be compiled and installed in
> the other modules.

 Oh, I hadn't noticed that it was in fact QT5BASE_EXAMPLES that was tested. I
had just seen that QT53D_EXAMPLES was not used anywhere else in the .mk file,
and hadn't thought of the possibility that this option would be encoded in the
qt.conf or something like that.

 Regards,
 Arnout
