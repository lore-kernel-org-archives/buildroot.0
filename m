From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Oct 2019 01:32:15 +0200
Subject: [Buildroot] Failure upgrading 8/2017 to 8/2019
In-Reply-To: <CAJJ6jxvMGKJoO=L6TSP9dc2Wyvg62GyKobn6nwemvUK-tC5RGw@mail.gmail.com>
References: <CAJJ6jxvMGKJoO=L6TSP9dc2Wyvg62GyKobn6nwemvUK-tC5RGw@mail.gmail.com>
Message-ID: <2269db7c-db41-3f26-9a1d-bcd7bb096c64@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/09/2019 16:54, Steve Calfee wrote:
> Hi, I decided to upgrade to the latest buildroot 8/2019. My latest
> pull/build was from 2017.8
> 
> When I tried to pull into my old tree I got a corrupted git tree - but
> I keep no custom stuff in the buildroot tree, so I just cloned a new
> copy from buildroot.org. I checked out tag 2019.08. I do like the
> external stuff.
> 
> I use a buildroot constructed toolchain (from maybe 2014), so make
> clean, make doesn't take soo long. But the build failed, any
> suggestions on how to get locale to build?
> 
> Thanks, Steve
> 
> It built for a very long time, but failed in the target-finalize step.
> It failed generating locales:
> 
> Generating locale en_US.UTF-8
> [error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category `LC_CTYPE'
> [error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
> `LC_NUMERIC'
> [error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category `LC_TIME'
> [error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
> `LC_COLLATE'
> [error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
> `LC_MONETARY'
> [error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
> `LC_MESSAGES'
> [error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category `LC_PAPER'
> [error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category `LC_NAME'
> [error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
> `LC_ADDRESS'
> [error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
> `LC_TELEPHONE'
> [error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
> `LC_MEASUREMENT'
> [error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
> `LC_IDENTIFICATION'
> [error] no output file produced because errors were issued
> Makefile:738: recipe for target 'target-finalize' failed
> make[1]: *** [target-finalize] Error 4
> Makefile:84: recipe for target '_all' failed
> make: *** [_all] Error 2

 I can reproduce this issue (with an external ARM toolchain) but haven't been
able to pinpoint the cause yet.

 Regards,
 Arnout
