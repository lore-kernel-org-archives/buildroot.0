From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 09:13:02 +0100
Subject: [Buildroot] [PATCH] dl-wrapper: Fix urlencode option never
 being sent to backend
In-Reply-To: <671b136857f0b184e19f2f5452c1e764766bf912.camel@vitec.com>
References: <b97d7c67314b9312d4a79aa1a40ec4bd55ed61ff.camel@vitec.com>
 <20181207173522.GH2561@scaer>
 <671b136857f0b184e19f2f5452c1e764766bf912.camel@vitec.com>
Message-ID: <20181210091302.1ea7ef1b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Dec 2018 08:03:27 +0000, Damien Th?bault wrote:

> I have a build configured with a primary site and
> BR2_PRIMARY_SITE_ONLY=y that failed to download libopenssl patches from
> the mirror.
> 
> If the autobuilders are directly using the original URLs or are falling
> back to the original URLs they should work fine.

Thanks! We really need to add some test cases in support/testing/ for
those "corner" cases, since they are not tested by the autobuilders or
in the most usual situations, they tend to be forgotten, and therefore
broken.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
