From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jan 2017 11:54:01 +0100
Subject: [Buildroot] [PATCH 1/1] git-crypt: new package
In-Reply-To: <20170130052832.bo2h4xebwfbbe4zo@tarshish>
References: <20170130002853.76103-1-francesconegri@gmail.com>
 <20170130052832.bo2h4xebwfbbe4zo@tarshish>
Message-ID: <20170130115401.02708a05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Jan 2017 07:28:32 +0200, Baruch Siach wrote:
> > +define GIT_CRYPT_BUILD_CMDS
> > +	$(MAKE) CXX="$(TARGET_CXX)" -C $(@D) all

Please use:

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
