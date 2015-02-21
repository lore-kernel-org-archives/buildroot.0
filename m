From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 15:56:26 +0100
Subject: [Buildroot] [PATCH] iodine: new package
In-Reply-To: <1424522729-22692-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424522729-22692-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150221155626.4f3d4b2c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 21 Feb 2015 09:45:29 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied to next, though I have one question, see below.


> +define IODINE_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" ARCH=$(BR2_ARCH) -C $(@D)

Is passing ARCH actually needed? I see ARCH being defined as `uname -m`
in src/Makefile, but it doesn't seem to be used anywhere.

If it's actually used, are we sure that the values of $(BR2_ARCH) match
what iodine expect as ARCH values?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
