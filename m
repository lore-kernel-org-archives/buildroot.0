From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 15:07:26 +0200
Subject: [Buildroot] [PATCH 14/15] package/refpolicy: fix the configure,
 build and install steps
In-Reply-To: <20200731101040.1723047-15-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
 <20200731101040.1723047-15-antoine.tenart@bootlin.com>
Message-ID: <20200904150726.60243664@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jul 2020 12:10:39 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> -define REFPOLICY_CONFIGURE_CMDS
> +define REFPOLICY_CONFIGURE_BUILD

I found it a bit silly to have REFPOLICY_CONFIGURE_CMDS calling
REFPOLICY_CONFIGURE_BUILD, so I've just inlined in
REFPOLICY_CONFIGURE_CMDS what REFPOLICY_CONFIGURE_BUILD is doing. See
the final commit at:

  https://git.buildroot.org/buildroot/commit/?id=fb2968707bc66afb2c246d92e15f295475f23868

Also, note that with your change, the policy is indeed being built
during the "build" step, but it is also built again during the target
installation step. However, due to how the refpolicy build system
works, this seems unavoidable, and this patch is anyway already an
improvement.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
