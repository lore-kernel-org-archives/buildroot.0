From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 21 Feb 2014 10:50:05 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140221100842.2d988a70@skate>
References: <20140221073009.2E62F10136B@stock.ovh.net>
 <20140221100842.2d988a70@skate>
Message-ID: <CAAXf6LWhNMeQkHgo_-b5KtmpYkfTTh=8G1n3k_BOJaALH2pqJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 21, 2014 at 10:08 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>
>>    powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/c1ffdd6fd0a7d352faddbe58a81b66c22bbf7bbf/
>
> Architecture support problem.
>
> ./Source/JavaScriptCore/assembler/MacroAssembler.h:62:2: error: #error "The MacroAssembler is not supported on this platform."
>

Last release cycle I looked into this, found an existing bug report,
and added onto it, but without a lot of success:
https://bugs.webkit.org/show_bug.cgi?id=113638
I managed to fix one part of the problem, but bumped into another one.
