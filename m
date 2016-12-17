From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 15:59:04 +0100
Subject: [Buildroot] [PATCH 2/2] package/aespipe: fix host compile
In-Reply-To: <20161217071659.3975-2-bernd.kuhls@t-online.de>
References: <20161217071659.3975-1-bernd.kuhls@t-online.de>
 <20161217071659.3975-2-bernd.kuhls@t-online.de>
Message-ID: <20161217155904.4d5b4511@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Dec 2016 08:16:59 +0100, Bernd Kuhls wrote:

> +HOST_AESPIPE_CONF_ENV = \
> +	CFLAGS="$(HOST_CFLAGS) -no-pie" \
> +	LDFLAGS="$(HOST_LDFLAGS) -no-pie"

I reverted this patch as it breaks the build on systems where gcc does
not understand -no-pie:

  http://autobuild.buildroot.net/?reason=host-aespipe-2.4d

A better solution is needed for this problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
