From: Tomas V. Arredondo <surf_fanatico@yahoo.com>
Date: Mon, 17 Aug 2020 03:50:58 +0000 (UTC)
Subject: [Buildroot] updating modules.conf?
References: <1493087963.2947865.1597636258601.ref@mail.yahoo.com>
Message-ID: <1493087963.2947865.1597636258601@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Really sorry to bother... I have a couple of questions, really appreciate any help...
Basically looking to disable modules and create others in modules.conf.? I don't see an obvious way of doing that as I tried adding my changes to a modules.conf patch but it failed given that the modules.conf file gets built and was not downloaded so it was not available for patching :-(
I did see a patch from 2016 that talked about updating modules.conf but the BR2_ option is not available anymore:?https://lists.buildroot.org/pipermail/buildroot/2016-April/158109.html

"> +REFPOLICY_MODULES_FILE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_MODULES_FILE))> +define REFPOLICY_CUSTOM_MODULES_CONF> +? ? ? ?cp $(REFPOLICY_MODULES_FILE) $(@D)/policy/modules.conf> +endef> +endif> +> +define REFPOLICY_CONFIGURE_CMDS> +? ? ? ?$(REFPOLICY_GIT_SUBMODULE_SETUP)
Goes away after submodules are supported."? <= submodules?
The other question is about the?S00selinux labelling script mentioned in the above patch, I see that it used semanage which is not available.? I have seen other versions with the fixfiles script (also not available in BR2 selinux I believe).??Does anyone know of any examples anywhere?? Appreciate the time.
Thanks a lot,Tomas Arredondo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200817/f62ac144/attachment-0001.html>
