From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 20:09:49 +0200
Subject: [Buildroot] [PATCH v4 1/2] packages: fix and improve support
 for top-level parallel makefile
In-Reply-To: <1435291134-6780-2-git-send-email-fabio.porcedda@gmail.com>
References: <1435291134-6780-1-git-send-email-fabio.porcedda@gmail.com>
 <1435291134-6780-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150626200949.64342552@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 26 Jun 2015 05:58:53 +0200, Fabio Porcedda wrote:
> To fix packages that fail to build when PARALLEL_JOBS is empty instead

Which packages specifically?

> of using an empty PARALLEL_JOBS just avoid to using it in

s/avoid to/avoid/

>  MAKE1 := $(HOSTMAKE) -j1
> -MAKE := $(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
> +override MAKE = $(HOSTMAKE) \
> +	$(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))

Why should we force to not use make -j for each individual package when
top-level parallel build is used ? Maybe for some scenarios it is better
to have 2 top-level jobs, and then 2 jobs per package ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
