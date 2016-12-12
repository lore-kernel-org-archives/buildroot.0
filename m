From: Christian Kellermann <christian.kellermann@solectrix.de>
Date: Mon, 12 Dec 2016 12:27:36 +0100
Subject: [Buildroot] [PATCH 1/1] linux: Setting a repo_version is
	mandatory for custom repositories
In-Reply-To: <58df8b4b-2d61-b93d-c96b-69ac9a4c084c@mind.be>
References: <58df8b4b-2d61-b93d-c96b-69ac9a4c084c@mind.be>
Message-ID: <1481542057-19945-1-git-send-email-christian.kellermann@solectrix.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>   Unless I'm very mistaken, this will never trigger, because the
>  option will be "" instead of empty when it has not been set by the
>  user. So it should be qstrip'ped.

I have added the qstrip and also added the warning for the linux-header package.

>   I think it is more convenient to check $(LINUX_VERSION).

I don't understand what you mean by this.

>   You can also drop the outer condition, so that it also checked for
>  BR2_LINUX_KERNEL_CUSTOM_VERSION. But then of course it should still
>  be in an ifeq ($(BR2_LINUX_KERNEL),y) condition. And you should
>  check if the CUSTOM_LOCAL and OVERRIDE_SRCDIR options still work
>  correctly.

I don't think this will be easier to read though. But if you think
it's an improvement I will change the patches accordingly.

CUSTOM_LOCAL works for me, how do I test OVERRIDE_SRCDIR?

>   And while you're at it, perhaps you can do the same for LINUX_SITE.

Did this.

Thanks,

Christian
