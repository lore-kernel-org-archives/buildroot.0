From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 07:23:38 +0200
Subject: [Buildroot] [PATCH v2] package/python-pycrypto: fix python3.8
 compatibility
In-Reply-To: <73a3a2b2-7279-c46a-e79b-2fe0a68cecfc@gmail.com>
References: <20200420140724.3206074-1-romain.naour@gmail.com>
 <20200421222847.09432773@windsurf.home>
 <CADvTj4qJ3jC_y_rNwwbDF5jq7xF8BAF39uqnuQKQgi3nxYTaBg@mail.gmail.com>
 <73a3a2b2-7279-c46a-e79b-2fe0a68cecfc@gmail.com>
Message-ID: <20200427072338.30adc711@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Apr 2020 00:25:54 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> > Actually we probably just need to add python-m2crypto and drop
> > https://github.com/buildroot/buildroot/blob/master/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
> > as it appears that python-m2crypto added support for python 3.  
> 
> python-m2crypto was removed from Buildroot by commit [1], it was only used by
> crda package. But since crda is a "legacy" package, I don't think it's worth the
> effort to re-add this package.
> 
> From [2]
>   "CRDA is no longer needed as of kernel v4.15 since commit 007f6c5e6eb45
>   ("cfg80211: support loading regulatory database as firmware file") added
>   support to use the kernel's firmware request API which looks for the
>   firmware on /lib/firmware. Because of this CRDA is legacy software for
>   older kernels. It will continue to be maintained."

We still have users running kernels < 4.15, so we need to keep
supporting CRDA for quite a while. It is too early to call it "legacy"
from a Buildroot perspective.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
