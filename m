From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 15:51:17 +0200
Subject: [Buildroot] [PATCH] c-icap: fix config script by adding
 $(STAGING_DIR) prefix to link path. It fixes c-icap-modules build.
In-Reply-To: <55AF9B0E.8080803@oliseo.fr>
References: <1437568841-20180-1-git-send-email-guillaume.gardet@oliseo.fr>
 <20150722145503.01f5bd26@free-electrons.com>
 <55AF9B0E.8080803@oliseo.fr>
Message-ID: <20150722155117.46a0e983@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillaume,

On Wed, 22 Jul 2015 15:30:54 +0200, Guillaume GARDET - Olis?o wrote:

> > What about just:
> >
> > 	$(SED) 's%-L$LIBDIR %%' $(STAGING_DIR)/usr/bin/c-icap-libicapapi-config
> 
> Ok, but $ sign must be escaped with another $:
>          $(SED) 's%-L$$LIBDIR %%' $(STAGING_DIR)/usr/bin/c-icap-libicapapi-config

Ah, yes, indeed. I missed that since I quickly tested the solution in a
shell.

> Do you want a I send a V2 with this solution?

Yes, please!

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
