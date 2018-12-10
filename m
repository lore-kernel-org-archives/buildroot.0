From: =?utf-8?B?RGFtaWVuIFRow6liYXVsdA==?= <damien.thebault@vitec.com>
Date: Mon, 10 Dec 2018 08:03:27 +0000
Subject: [Buildroot] [PATCH] dl-wrapper: Fix urlencode option never
 being sent to backend
In-Reply-To: <20181207173522.GH2561@scaer>
References: <b97d7c67314b9312d4a79aa1a40ec4bd55ed61ff.camel@vitec.com>
 <20181207173522.GH2561@scaer>
Message-ID: <671b136857f0b184e19f2f5452c1e764766bf912.camel@vitec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2018-12-07 at 18:35 +0100, Yann E. MORIN wrote:
> On 2018-12-07 12:41 +0000, Damien Th?bault spake thusly:
> > The urlencode parameter is lost in dl-wrapper, because we try to
> > get it
> > from backend instead of backend_urlencode.
> > 
> > We must get the urlencode information from backend_urlencode.
> 
> What is this trying to fix, actually? We have no download issue in
> the autobuilders, as far as I can see... Do you have a test-case to
> share?

Hello Yann,

I have a build configured with a primary site and
BR2_PRIMARY_SITE_ONLY=y that failed to download libopenssl patches from
the mirror.

If the autobuilders are directly using the original URLs or are falling
back to the original URLs they should work fine.

On Sun, 2018-12-09 at 17:18 +0100, Thomas Petazzoni wrote:
> Applied to master, thanks.

Thank you !
-- 
Damien Th?bault
