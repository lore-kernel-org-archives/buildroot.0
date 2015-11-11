From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 09:49:31 +0100
Subject: [Buildroot] [PATCH] liquid-dsp: fix powerpc/altivec build
 failures
In-Reply-To: <1447164605-14899-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447164605-14899-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151111094931.00b09ad6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 10 Nov 2015 11:10:05 -0300, Gustavo Zacarias wrote:
> When a powerpc target is detected the build system tries to force
> altivec support but that's wrong:
> 
> Not every powerpc processor has altivec instruction support.
> 
> It's using the removed/deprecated -faltivec compiler directive when it
> should be using -maltivec instead.
> 
> Even if the above conditions are corrected the altivec codepath fails
> to build properly.
> 
> So just disable altivec in general using the standard
> --enable-simdoverride configure option. Fixes:
> 
> http://autobuild.buildroot.net/results/e1b/e1b6cf76a7a4ae754a928d211e779e9381198f48/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Thanks for fixing this! Could you also report the problem to the
upstream project?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
