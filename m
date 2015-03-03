From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Mar 2015 11:48:20 +0100
Subject: [Buildroot] [PATCH] perl: needs host-bison
In-Reply-To: <1425378663-2659-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425378663-2659-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150303114820.32b71d7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  3 Mar 2015 07:31:03 -0300, Gustavo Zacarias wrote:

>  define PERL_BUILD_CMDS
> -	$(MAKE1) -C $(@D) all
> +	PATH=$(BR_PATH) $(MAKE1) -C $(@D) all

Use $(TARGET_MAKE_ENV) instead.

>  define HOST_PERL_BUILD_CMDS
> -	$(MAKE) -C $(@D)
> +	PATH=$(BR_PATH) $(MAKE) -C $(@D)

and $(HOST_MAKE_ENV).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
