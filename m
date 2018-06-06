From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Jun 2018 07:52:00 +0200
Subject: [Buildroot] [BUILDROOT][PATCHv2 1/3] balena: new package
In-Reply-To: <5350eb85-bc35-bc0b-c173-b354bfb18fb4@savronik.com.tr>
References: <651f579d-07ad-afc4-4515-0061016dfc02@savronik.com.tr>
 <20180605152819.6950ef99@windsurf>
 <5350eb85-bc35-bc0b-c173-b354bfb18fb4@savronik.com.tr>
Message-ID: <20180606075200.67262f61@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Jun 2018 08:26:28 +0300, Refik Tuzakl? wrote:

> >> +BALENA_LDFLAGS += -extldflags '-static'  
> > Same.  
> I think we need it because in the pkg-golang. mk there is if clause 
> about it;
> ifeq ($(BR2_STATIC_LIBS),y)
> $(2)_LDFLAGS += -extldflags '-static'
> endif
> in our dependencies BR2_STATIC_LIBS should be "n"

Why is -extldflags '-static' needed when BR2_STATIC_LIBS is disabled ?
It shouldn't be necessary.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
