From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Wed, 15 Sep 2010 20:40:54 +0200
Subject: [Buildroot] external toolchain question
In-Reply-To: <4C910D9F.2060308@carallon.com>
References: <4C910D9F.2060308@carallon.com>
Message-ID: <4C911336.6060003@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Am 15.09.2010 20:17, schrieb William Wagner:
>  Hello,
>
> I'm trying to get a crosstool-ng toolchain working and running into a 
> few problems. One thing I found with c++ support was that libstdc++ 
> was being copied into target/usr/lib but it was located in staging/lib.
>
> It seems like this commit 
> http://git.buildroot.net/buildroot/commit/?id=ecb7642cce36bc68d93f0eee677adc7da538228d 
> explicitly moved it in the target. The comment appears to be for an 
> external buildroot toolchain not a crosstools toochain. Is that why it 
> works for some people? For my crosstools toolchain it seemed that 
> moving it fixed my problem.
>
> As an aside what is the status of using a buildroot generated 
> toolchain as an external toolchain? Any instructions anywhere on how 
> to do it?
>
Hi Will,
I asked a similar questions some time before. Grant answered to my 
question "preserve toolchain", that he didn't manage to recycle the 
buildroot generated toolchain for a second run in an easy way. So it 
seems, that you are forced to from scratch including the toolchain if 
you do not use a "complete" external toolchain (e.g. generated with 
crosstool-ng).

Personally I didn't yet try out crosstool-ng because the current 
patchlevel of buildroot is a higher one (e.g. gcc 4.3.4 vs 4.3.5).

Regards,
Marcus
