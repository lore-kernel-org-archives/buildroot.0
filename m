From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 22:12:13 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-20
In-Reply-To: <39A54937CC95F24AA2F794E2D2B66B1356CB9F10@de02wembxa.internal.synopsys.com>
References: <20140421063009.036D5100FF4@stock.ovh.net>
 <20140421114949.59c65c31@skate>
 <39A54937CC95F24AA2F794E2D2B66B1356CB9EA2@de02wembxa.internal.synopsys.com>
 <20140421135807.3002c46f@skate>
 <39A54937CC95F24AA2F794E2D2B66B1356CB9F10@de02wembxa.internal.synopsys.com>
Message-ID: <20140421221213.0494d4f8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Mon, 21 Apr 2014 13:29:14 +0000, Anton Kolesov wrote:

> Makefile.in of openswan contains -fPIE hardcoded . I suppose that is
> for the "security reasons", because this packages is IPsec
> implementation. I'm not a security expert, so I'm not sure how much
> PIE is important here. I would say that it is not much of the use to
> apply randomization to selected package, while leaving the rest of
> software on the same system without randomization.

Since we don't build all our binaries -fPIE, I don't think it makes
much sense to build just openswan -fPIE. So probably a simple patch to
remove -fPIE from openswan makefiles should be OK.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
