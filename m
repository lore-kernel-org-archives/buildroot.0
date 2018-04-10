From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 08:56:45 +0200
Subject: [Buildroot] [PATCH v6 1/4] imx-mkimage: new package
In-Reply-To: <CAPP7BN1C+Z-i5Vvv60TwycBL7cn6GMwdR+=vdPY-w6ZevsBpsg@mail.gmail.com>
References: <1520682702-10035-1-git-send-email-karl.erik.larsson@gmail.com>
 <1520682702-10035-2-git-send-email-karl.erik.larsson@gmail.com>
 <20180409220758.5b9b801d@windsurf>
 <CAPP7BN1C+Z-i5Vvv60TwycBL7cn6GMwdR+=vdPY-w6ZevsBpsg@mail.gmail.com>
Message-ID: <20180410085645.7a74d6b6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 07:27:22 +0200, Erik Larsson wrote:

> > This commit log really needs to be extended. What was the need to add
> > LDFLAGS ? It seems like a very simple program, which could be built
> > without special LDFLAGS. What was the issue that lead you to add this
> > patch ?  
> 
> If LDFLAGS is not added it will use the host machine libz, and fail if
> not available, but by adding LDFLAGS it will build using Buildroot
> compiled libz.

Hum, indeed, we're building a host package here, so we need to
explicitly pass -L$(HOST_DIR)/lib, otherwise we link against the
system-provided libraries.

> Do you want me to update the patch information in a new patch?

Yes, that would be nice. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
