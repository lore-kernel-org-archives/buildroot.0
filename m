From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 19:41:57 +0200
Subject: [Buildroot] [PATCH 2/8] package/mender: update install of
 config files
In-Reply-To: <CADHdJwCjktMrL2YQpKbzm45n0UoqpXRLHGjy1PyQJv_SRwH-Ug@mail.gmail.com>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-3-mirza.krak@northern.tech>
 <20180815143144.587c2045@windsurf>
 <CADHdJwCjktMrL2YQpKbzm45n0UoqpXRLHGjy1PyQJv_SRwH-Ug@mail.gmail.com>
Message-ID: <20180815194157.782858ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Aug 2018 14:42:51 +0200, Mirza Krak wrote:

> > Do you know why tenant.conf was added in the current Mender packaging ?
> > Was it an old configuration file from previous Mender versions ?  
> 
> This was something that we did deploy in our Yocto recipes (which
> might have been source of inspiration for the package in Buildroot),
> but it was never actually used for anything. There is an option in
> mender.conf for this, TenantToken.

Which is set to ?

tenant.conf was the target of a symlink, created in the systemd unit
file:

/bin/ln -sf /etc/mender/tenant.conf /var/lib/mender/authtentoken

How does it work now ?

> > The installation path has changed from /var/share, to /usr/share. Why ?  
> 
> /var/share was incorrect, it has always been /usr/share.

So in its current state, the mender package in Buildroot doesn't work ?
I'm trying to figure out if this is a bug, or just a preference. If
it's a bug, we need to fix it in the master branch, and perhaps
backport it to our LTS release.

In your next iteration of the patches, could you please clearly
separate the bug fixes as separate patches. They should come first in
the series, before the improvements/cleanups.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
