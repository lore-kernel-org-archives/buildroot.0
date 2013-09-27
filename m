From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Sep 2013 12:50:26 +0200
Subject: [Buildroot] [PATCH] configs: add Freescale i.MX 6SoloLite EVK
	support
In-Reply-To: <CAKcgs2x1v5=aMLy0HCbJoLGK-A9rn=WBNZevgbyk-Jnui5yK9A@mail.gmail.com>
 (Gilles Talis's message of "Fri, 27 Sep 2013 12:08:22 +0200")
References: <1380185523-26736-1-git-send-email-gilles.talis@gmail.com>
 <87fvsr5q7z.fsf@dell.be.48ers.dk>
 <CAKcgs2wLPOTpRqu5Xe_1LkuuZwCcuAfHOSfS+Hy+gvpbS_Vk3g@mail.gmail.com>
 <87ioxm4m6m.fsf@dell.be.48ers.dk>
 <CAKcgs2x1v5=aMLy0HCbJoLGK-A9rn=WBNZevgbyk-Jnui5yK9A@mail.gmail.com>
Message-ID: <87eh8a4jyl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Hi Peter,
 >> It's not really a problem, no - Just quite uncommon. Do notice that
 >> Buildroot automatically enables devtmpfs support in the kernel if
 >> needed, so it should all just work.

 Gilles> Does it? I was not aware of that. It did not seem to work for me,
 Gilles> hence the reason why I had to force static device nodes. Let me give
 Gilles> it another try and see how it goes.

As long as you build the kernel through buildroot it should:

git grep -B1  DEVTMPFS linux/linux.mk
linux/linux.mk- $(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
linux/linux.mk:         $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
linux/linux.mk:         $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.c

-- 
Bye, Peter Korsgaard
