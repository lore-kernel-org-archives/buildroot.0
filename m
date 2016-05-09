From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 23:21:19 +0200
Subject: [Buildroot] [PATCH 1/1] rrdtool: bump version to 1.6.0
In-Reply-To: <1462824635-15327-1-git-send-email-fli4l@franke-prem.de>
References: <1462824635-15327-1-git-send-email-fli4l@franke-prem.de>
Message-ID: <20160509232119.668c0b36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 May 2016 22:10:35 +0200, Roland Franke wrote:
> delete patch 0001-Add-configure-option-to-disable-documentation.patch
> as this is now include in the new version.
> 
> Signed-off-by: Roland Franke <fli4l@franke-prem.de>

Thanks for your patch. One question below, though.

> -# For 0001-Add-configure-option-to-disable-documentation.patch
>  RRDTOOL_AUTORECONF = YES
>  RRDTOOL_GETTEXTIZE = YES

Enabling autoreconf and gettextize was added when
0001-Add-configure-option-to-disable-documentation.patch was added by
Gustavo. So I would assume that they could now be removed.

However, it turns out that rrdtool 1.6.0 doesn't build without
autoreconf+gettextize, I'm not sure why. In any case, the comment
should be updated and not removed.

I'm Cc'ing Gustavo who originally added the patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
