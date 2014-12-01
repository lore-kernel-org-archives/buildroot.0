From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 1 Dec 2014 14:28:33 +0000
Subject: [Buildroot] [PATCH v3] Add a defconfig for MIPS Creator CI20
In-Reply-To: <8761dvh300.fsf@dell.be.48ers.dk>
References: <1417193009-65132-1-git-send-email-Vincent.Riera@imgtec.com>	<87wq6ejtsz.fsf@dell.be.48ers.dk>
 <547C3F7B.3060804@imgtec.com>	<87zjb7hdud.fsf@dell.be.48ers.dk>
 <547C4367.2070207@imgtec.com>	<87vblvhd4j.fsf@dell.be.48ers.dk>
 <547C75C4.2070204@imgtec.com> <8761dvh300.fsf@dell.be.48ers.dk>
Message-ID: <547C7B11.5060203@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/01/2014 02:13 PM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
>  >> Exactly: We do some minimal config tweaks to ensure you have a working
>  >> setup. See the logic in linux/linux.mk (LINUX_CONFIGURE_CMDS).
> 
>  > I have seen that file and I found this snippet:
> 
>  > $(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
>  >   $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
>  >   $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
> 
>  > It adds those two options to the kernel config only if
>  > BR2_ROOTFS_DEVICE_CREATION_STATIC has been selected. I think this is
>  > also needed for BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS. I'm going
>  > to test it right now to make sure.
> 
> No, notice the 2x ",". The syntax of the $(if ) construct is $(if
> <condition>,<command-of-nonempty>,<command-if-empty>), so this is done
> for everything but the static /dev case.
> 
>  > Also, could you tell me why that if statement has two comma (,,) instead
>  > of one? What's the difference with having only one comma?
> 
> See above or:
> 
> https://www.gnu.org/software/make/manual/html_node/Conditional-Functions.html#index-if

Facepalm.

Thanks Peter, I will send a patch to remove the MDEV option in the
ci20_defconfig.

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
