From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 16 Aug 2016 21:24:22 -0300
Subject: [Buildroot] BuildRoot cannot build powerpc64
References: <F9C551623D2CBB4C9488801D14F864C6EE8B1000@ex-mb1.corp.adtran.com>
Message-ID: <57b3aeb6944cf_7ec33f915a8b1b9c298e6@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andy,

On Tue, Aug 16, 2016 at 07:43 PM, ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wrote:

> All,
> 
> I just downloaded 2016_08rc-1 and attempted to build an RFS for the
> T-series PowerPC parts, which, I assume, are powerpc64 and e5500.  In
> doing so, after I select powerpc64 I cannot select any library for the
> toolchain as all of the config dependencies appear to be excluding
> powerpc64 in the options.
> 
> Is this by design or oversight?

With Ubuntu 16.04 I can reproduce the behavior only after selecting static libs.

BR2_powerpc64=y
BR2_powerpc_e5500=y
BR2_STATIC_LIBS=y

Maybe you can unblock your work if static build is not a strict requirement.

Regards,
Ricardo
