From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Mon, 28 Jul 2014 18:20:35 +0200
Subject: [Buildroot] [PATCH 1/2] package/webkit: Fix detection of egl
 headers provided by rpi-userland
In-Reply-To: <XnsA375DB67EA6D7berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1401366393-5815-1-git-send-email-bernd.kuhls@t-online.de>
 <1401366393-5815-2-git-send-email-bernd.kuhls@t-online.de>
 <20140723235453.5ebea556@free-electrons.com>
 <XnsA375DB67EA6D7berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <53D67853.7070007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Fri, 25 Jul 2014 21:34:07 +0200, Bernd Kuhls wrote:
> Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
> @public.gmane.org> wrote in news:20140723235453.5ebea556 at free-electrons.com:
> 
>> Could you update on whether this patch and patch 2/2 in this series are
>> still needed? There were also unanswered questions in your patch 2/2.
> 
> Hi Thomas,
> 
> the autobuild error I was trying to fix occured on May 29th:
> http://autobuild.buildroot.net/results/bc0/bc0f9114f9dacf68a510f1e01f2dc3661c
> 34f536/
> 
> The same error was still present on July, 21th:
> http://autobuild.buildroot.net/results/1e8/1e8cab75025316b22205be7fb08a93148a
> 256b9c/
> 
> As I wrote in my cover letter[1] for this patch series
> 
>> the rpi experts should have a closer look whether webkit could work on rpi
>> despite the current problem
> 
> I asked for this help because I have basically no knowledge about the rpi-
> specific binary blobs provided by rpi-userland.
> 
> Maybe Hadrien?s patch series[2] to bump webkit to 2.4.3 will solve the 
> problem in a better way than with my patches.
> 
> @Hadrien: Could you please test your patch using the defconfig used by the 
> autobuilder where webkit-1 failed to compile for rpi?

Actually, I had forgotten this problem but yes, when I initially tested
the bump of WebKit with rpi-userland the EGL check failed too. So it's
not solved in my series or with version 2.4.3 and this seems to be
related to rpi-userland (no problem with ti-gfx and imx-lib, with which
I test now).

I will test my patch with the defconfig used by the autobuilder and test
your patch if the problem occurs again.

Regards,

Hadrien
