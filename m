From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 14:08:19 +0200
Subject: [Buildroot] [PATCH 1/1] wf111: ARM bumped to 5.2.2-r4
In-Reply-To: <CAC03NDYtNQwfxU3i0G9e1kM3y7LV3o_TumBnJj+85Sa=KUf8PA@mail.gmail.com>
References: <CAC03NDYtNQwfxU3i0G9e1kM3y7LV3o_TumBnJj+85Sa=KUf8PA@mail.gmail.com>
Message-ID: <20180814140819.6f5d53b7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Geert,

Thanks for your patch. Unfortunately, it is sent as attached file, and
not inline, so we can't review it properly. Could you resend it with
"git send-email", so that it is sent inline ?

(Please don't send it inline manually with your e-mail client, because
it will most likely rewrap long lines and damage the patch).

That being said, the patch looks mostly good. A couple of comments
though:

 - The fields in the .hash file are not properly aligned. I.e, on the
   first hash there is only one space between "sha256" and the hash
   itself, and on the following lines, there are two spaces.

 - We really want the WF111_VERSION variable to be defined, so could
   you change the code to:

ifeq ($(BR2_ARM_CPU_ARMV7A),y)
WF111_VERSION = $(WF111_VERSION_ARM)
...
else ifeq ($(BR2_ARM_CPU_ARMV5),y)
WF111_VERSION = $(WF111_VERSION_ARM)
...
else
WF111_VERSION = $(WF111_VERSION_X86)
...
endif

or alternatively:

ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_ARM_CPU_ARMV5),y)
WF111_VERSION = 5.2.2-r4
else
WF111_VERSION = 5.2.2-r3
endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
