From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 22:30:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/postgresql: needs wchar
In-Reply-To: <643ca3d2-1825-4707-5fbb-0817229188f9@mind.be>
References: <20181023160931.16417-1-bernd.kuhls@t-online.de>
 <CAFSsvmqEdPu2V3j=d55j6cUVmNeC0MSjTmA5HM1R5HcWh1LzwA@mail.gmail.com>
 <643ca3d2-1825-4707-5fbb-0817229188f9@mind.be>
Message-ID: <20181101223046.72222a3c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Oct 2018 19:04:26 +0100, Arnout Vandecappelle wrote:

>  It is not strictly needed, but it is still useful to have it because:

True. In this case:

 - Bernd did not propagate the dependency to p?p, qt and qt5base, which
   all three are also directly selecting BR2_PACKAGE_POSTGRESQL

 - A number of places where BR2_PACKAGE_POSTGRESQL is selected do not
   have the !BR2_STATIC_LIBS dependency.

I am really wondering what to do with those "useless" dependencies in
general. On one hand, I agree with you that semantically, it is better
to have them. On the other hand:

 - It's an additional maintenance burden.

 - It's never tested by the autobuilders, because such "useless"
   dependencies are well, useless, because they are hidden by another
   higher-level dependency. Because they are not tested, they are often
   wrong and not maintained.

Due to this, whether we propagate them or not is completely random
currently through the Buildroot tree, and I'm not sure it's a very nice
situation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
