From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 15:47:09 +0100
Subject: [Buildroot] [PATCH 2/2] package/matchbox-desktop: needs -ldl
In-Reply-To: <CAPi7W83SQuDc_Adb00z0cpGrG-VM68MWkXaakxwsmEujfGTVKw@mail.gmail.com>
References: <20191030092245.10235-1-fontaine.fabrice@gmail.com>
 <20191030092245.10235-2-fontaine.fabrice@gmail.com>
 <20191120182301.GN32494@scaer>
 <CAPi7W83SQuDc_Adb00z0cpGrG-VM68MWkXaakxwsmEujfGTVKw@mail.gmail.com>
Message-ID: <20191208154709.5f81511e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Nov 2019 20:06:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > I'd like to understand what is really going on here, because there are
> > build more recent than this one, which do build successfully:
> >     http://autobuild.buildroot.org/results/c9c/c9c02c2c6d29f447c82adf9c05c141f288de1754/
> >
> > So definitely, the autoreconf does work in some cases.
> >
> > So, can we identify the reason it fails in some caes and not in others?  
> Build failures started on October 22nd so perhaps this issue is also
> linked to commit 9cc8680fe54c0b8f5008158e36e2157127f03a7e.
> There is already discussions ongoing about if for gmpc that missed -lm
> (https://patchwork.ozlabs.org/patch/1186343/) and libv4l that missed
> -latomic (https://patchwork.ozlabs.org/patch/1186541).

I did a test, and I can confirm that
http://patchwork.ozlabs.org/patch/1204728/ fixes the matchbox-desktop
build issue, and makes this patch not needed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
