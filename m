From: Florian Fainelli <f.fainelli@gmail.com>
Date: Sun, 05 Nov 2017 21:36:39 -0800
Subject: [Buildroot] [PATCH] ethtool: Allow enabling/disabling pretty
 printing
In-Reply-To: <20171106053002.br4zv6aq3hvjc4q7@sapphire.tkos.co.il>
References: <20171106012906.22000-1-f.fainelli@gmail.com>
 <20171106053002.br4zv6aq3hvjc4q7@sapphire.tkos.co.il>
Message-ID: <78E2EA83-B6D6-448B-8B89-60A15B5E0658@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On November 5, 2017 9:30:03 PM PST, Baruch Siach <baruch@tkos.co.il> wrote:
>Hi Florian,
>
>On Sun, Nov 05, 2017 at 05:29:06PM -0800, Florian Fainelli wrote:
>> Ethtool has a configure script option allowing the enabling or
>disabling of
>> pretty printing for drivers, SFP modules etc which can save a
>significant
>> amount of bytes on the root filesystem. Allow selecting that, and
>turn it on by
>> default (like ethtool's configure script).
>
>Have you measured the impact on the target size?

Yes, this was included in the original commit message:

https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/commit/?id=875616dfcbe57ea0f639a20d85fcbad2172ad744

~500 Kbytes on a x86_64 build
~337 Kbytes on a arm build 

(savings from the original size)

>
>A test build I ran here (ARM Cortex-A9, musl) showed a significant
>reduction 
>of the (stripped) binary size from 233124 to 60408.

My numbers were not stripped AFAIR, but what you are posting sounds about right.

Thanks
Hello,
-- 
Florian
