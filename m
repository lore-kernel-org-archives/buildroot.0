From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 00:01:05 +0200
Subject: [Buildroot] [PATCH v3 1/3] Makefile: add tainting support
In-Reply-To: <CA+_SqVZcTc2m4A9NiumRtPAd3B7cyZ7Od0Xf_SfQ9dcUqgXTvg@mail.gmail.com>
References: <1536163596-5310-1-git-send-email-angelo@amarulasolutions.com>
 <1536163596-5310-2-git-send-email-angelo@amarulasolutions.com>
 <20180905213727.56f5fecc@windsurf>
 <CA+_SqVZcTc2m4A9NiumRtPAd3B7cyZ7Od0Xf_SfQ9dcUqgXTvg@mail.gmail.com>
Message-ID: <20180906000105.021f9ccc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Sep 2018 23:45:47 +0200, Angelo Compagnucci wrote:

> > So: do we care about host packages for "tainting" ? If we do care, how
> > do we handle this ?  
> 
> I think we can demand the decision to when we will have a host package
> that needs tainting support.
> 
> Moreover, I don't think the demand for host packages that needs
> tainting support will be high in the future.

Then we need to make that explicit:

ifeq ($$($(2)_TYPE),host)
ifneq ($$($(2)_TAINTS),)
$$(error "Host package $(1) has $(2)_TAINTS set: not supported)
endif
endif

of course, please check that this really works as expected.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
