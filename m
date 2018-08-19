From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Aug 2018 23:10:35 +0200
Subject: [Buildroot] [PATCH v3 1/1] Python3: Bump to 3.7.0
In-Reply-To: <20180819155655.65466d16@windsurf>
References: <20180817184607.27639-1-aduskett@gmail.com>
 <20180819155655.65466d16@windsurf>
Message-ID: <20180819231035.4d05c225@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 15:56:55 +0200, Thomas Petazzoni wrote:

> On Fri, 17 Aug 2018 11:46:07 -0700, Adam Duskett wrote:
> > From: Adam Duskett <aduskett@greenlots.com>  
> 
> This version bump is breaking host-python-vcversioner:
> 
>   http://autobuild.buildroot.net/?reason=host-python-vcversioner%
> 
> Could you have a look ?

It is also breaking:

 - kmod
   http://autobuild.buildroot.net/results/591/5914d32f7a11faf0148eceab7ed852f67357b0b5/build-end.log

 - host-meson
   http://autobuild.buildroot.net/results/99e/99eb91573e74a39d395212f2c470ce55d0412ec0/build-end.log

The issues don't seem to be that trivial. Unless we fix them quickly,
I'm tempted to revert the bump to 3.7.0 until those issues are
resolved, as we are going to see a lot of autobuilder failures
otherwise.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
