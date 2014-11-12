From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Nov 2014 13:34:18 +0100
Subject: [Buildroot] Buildroot and kernel modules
In-Reply-To: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A5C3C97@AMEHLEX02.ehl.pri>
References: <CAEk40fxcdS-gS9Q8LM-W8pKUP3=PUSkbL9Crq63kvcpG5LBf=Q@mail.gmail.com>
 <20141112110354.1a6bcc98@free-electrons.com>
 <A2A6A18A7161D44FBCA90D5B3AF90A2E5A5C3C97@AMEHLEX02.ehl.pri>
Message-ID: <20141112133418.728a5f52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paassen, Hiram van,

On Wed, 12 Nov 2014 12:21:12 +0000, Paassen, Hiram van wrote:

> As an alternative we use a buildroot package with something like this in
> it:
> 
> KERNELMODULE_DEPENDENCIES = linux
> 
> define KERNELMODULE_BUILD_CMDS
>    $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
> endef
> 
> define KERNELMODULE_INSTALL_TARGET_CMDS
>    $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules_install
> endef
> 
> $(eval $(generic-package))
> 
> 
> which basically builds a normal out of tree module.

Yes, that's what should be done if your module is out of tree, indeed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
