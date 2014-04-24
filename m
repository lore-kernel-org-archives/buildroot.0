From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 18:41:36 +0200
Subject: [Buildroot] [PATCH] Makefile: target-purgelocales: add
 dependencies
In-Reply-To: <1398356679-1438-1-git-send-email-fabio.porcedda@gmail.com>
References: <1398356679-1438-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140424184136.572de3d0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Thu, 24 Apr 2014 18:24:39 +0200, Fabio Porcedda wrote:

> -target-purgelocales:
> +target-purgelocales: $(filter-out target-purgelocales,$(TARGETS))
>  	rm -f $(LOCALE_WHITELIST)
>  	for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done

Don't we have several other targets that need to be executed only after
all packages have been built and installed? Wouldn't it make sense to
have a common solution for these? Like maybe a dedicated target?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
