From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 22:03:15 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: bump version to
 v4.1-2345 and fix version reporting
In-Reply-To: <20161128103231.21626-1-damjan.marion@gmail.com>
References: <20161128103231.21626-1-damjan.marion@gmail.com>
Message-ID: <20161128220315.1924903c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Nov 2016 11:32:31 +0100, Damjan Marion wrote:
> tvheadedend tracks version information based on git version
> numbers. As tvheadend is downloaded as tarball form github
> it was reporting version 0.0.0~unknown.
> 
> Signed-off-by: Damjan Marion <damjan.marion@gmail.com>

Could you split the bump and the version fix reporting in two separate
patches?

> -TVHEADEND_VERSION = 50a370707aedf5c127e92bb517c378aa8ac04657
> +TVHEADEND_VERSION = v4.1-2345-g04ff649

Please keep this as a full hash, like it used to be. It should still
work fine with the version reporting, if you write this version to
$(@D)/rpm/version, like you're doing below.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
