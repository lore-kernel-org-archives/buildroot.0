From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Aug 2019 15:47:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvips: bump version to 8.8.1
In-Reply-To: <20190809104655.3158-1-averyanovin@gmail.com>
References: <20190809104655.3158-1-averyanovin@gmail.com>
Message-ID: <20190814154711.185e2969@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ilya,

Thanks for your contribution!

On Fri,  9 Aug 2019 13:46:55 +0300
averyanovin at gmail.com wrote:

> From: Ilya Averyanov <averyanovin@gmail.com>
> 
> Remove patch. Now gtk-doc disable correct.
> 
> Signed-off-by: Ilya Averyanov <averyanovin@gmail.com>

I've applied to next, but there was a major issue in your update: this
new version of libvips uses the expat XML library, and no longer
libxml2. So as such, your version bump was not even building. You
probably had the expat library built by another package, which is why
when testing version bumps, it's always good to do a build with *just*
the package you've modified, to verify all its dependencies are
properly described.

As said, I've fixed that and applied. Thanks again for your
contribution!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
