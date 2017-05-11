From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 17:53:42 +0200
Subject: [Buildroot] [PATCH] qwt: fix build when BR2_STATIC_LIBS=y
In-Reply-To: <20170511134657.8755-1-gwenj@trabucayre.com>
References: <20170511134657.8755-1-gwenj@trabucayre.com>
Message-ID: <20170511175342.01ec583d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 May 2017 15:46:57 +0200, Gwenhael Goavec-Merou wrote:

> +ifeq ($(BR2_STATIC_LIBS),y)
> +QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/\# QWT_CONFIG += QwtDll/'
> +else
> +QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/\QWT_CONFIG += QwtDll/'

                                                 ^^ this backslash shouldn't be here

I've fixed that and applied to master. Thanks a lot for working so
quickly on a patch!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
