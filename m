From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Feb 2013 13:49:52 +0100
Subject: [Buildroot] [PATCH 1/5] In order to have a better support for
 python external package make the python menu clearer. Python2 and Python3
 are now mutually exclusive
In-Reply-To: <1360671849-7621-2-git-send-email-kpa_info@yahoo.fr>
References: <1360671849-7621-1-git-send-email-kpa_info@yahoo.fr>
 <1360671849-7621-2-git-send-email-kpa_info@yahoo.fr>
Message-ID: <20130212134952.1b43d8b6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patrick Gerber,

On Tue, 12 Feb 2013 13:24:05 +0100, Patrick Gerber wrote:
> 
> Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
> ---
>  package/Config.in                |   19 +------------
>  package/python-generic/Config.in |   56 ++++++++++++++++++++++++++++++++++++++
>  package/python/Config.in         |   14 ----------
>  package/python3/Config.in        |   14 ----------
>  4 files changed, 57 insertions(+), 46 deletions(-)
>  create mode 100644 package/python-generic/Config.in

This seems really complicated. Can't we just have a depends
on !BR2_PACKAGE_PYTHON in the python3 package, and a depends
on !BR2_PACKAGE_PYTHON3 in the python package?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
