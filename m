From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:06:53 +0100
Subject: [Buildroot] [PATCH v2,1/2] libmediaart: new package
In-Reply-To: <CAPi7W83QtcZM=wEFtZ6TMmSRRK-7ewBTUs36+Bpi1=Me37gx6A@mail.gmail.com>
References: <1490387931-113759-1-git-send-email-fontaine.fabrice@gmail.com>
 <20170324215727.3d17fc1b@free-electrons.com>
 <CAPi7W83QtcZM=wEFtZ6TMmSRRK-7ewBTUs36+Bpi1=Me37gx6A@mail.gmail.com>
Message-ID: <20170325140653.316dd161@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Mar 2017 11:10:31 +0100, Fabrice Fontaine wrote:

> Yes, they're mutually exclusive. If both are enabled, configure will fail  
> because of the followig lines in configure.ac:
> if test "x$enable_qt" == "xyes" && test "x$enable_gdkpixbuf" == "xyes";
> then
> AC_MSG_ERROR([Can not enable both Qt and GdkPixbuf backends, please pick
> one])
> fi

OK, indeed. So we've got different solutions here:

 1. Use an explicit Config.in choice, like you did.

 2. Use automatic dependencies like I suggested, but enable only one
    backend at a time if both Qt and Gtk are enabled.

I guess the solution (1) you initially proposed is OK.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
