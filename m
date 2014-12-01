From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 15:13:35 +0100
Subject: [Buildroot] [PATCH v3] Add a defconfig for MIPS Creator CI20
In-Reply-To: <547C75C4.2070204@imgtec.com> (Vicente Olivert Riera's message of
 "Mon, 1 Dec 2014 14:05:56 +0000")
References: <1417193009-65132-1-git-send-email-Vincent.Riera@imgtec.com>
 <87wq6ejtsz.fsf@dell.be.48ers.dk> <547C3F7B.3060804@imgtec.com>
 <87zjb7hdud.fsf@dell.be.48ers.dk> <547C4367.2070207@imgtec.com>
 <87vblvhd4j.fsf@dell.be.48ers.dk> <547C75C4.2070204@imgtec.com>
Message-ID: <8761dvh300.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 >> Exactly: We do some minimal config tweaks to ensure you have a working
 >> setup. See the logic in linux/linux.mk (LINUX_CONFIGURE_CMDS).

 > I have seen that file and I found this snippet:

 > $(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
 >   $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
 >   $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))

 > It adds those two options to the kernel config only if
 > BR2_ROOTFS_DEVICE_CREATION_STATIC has been selected. I think this is
 > also needed for BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS. I'm going
 > to test it right now to make sure.

No, notice the 2x ",". The syntax of the $(if ) construct is $(if
<condition>,<command-of-nonempty>,<command-if-empty>), so this is done
for everything but the static /dev case.

 > Also, could you tell me why that if statement has two comma (,,) instead
 > of one? What's the different with having only one comma?

See above or:

https://www.gnu.org/software/make/manual/html_node/Conditional-Functions.html#index-if

-- 
Venlig hilsen,
Peter Korsgaard 
