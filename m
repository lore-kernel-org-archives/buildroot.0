From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2019 13:47:07 +0200
Subject: [Buildroot] [git commit branch/next] package/util-linux: build
 programs and libraries in separate packages
In-Reply-To: <CAJ4jsaf1JwSsi_frDxm_sJt28tP1UJ7xJ-s0CKWRFS3J9w+DNg@mail.gmail.com>
References: <20190821213725.87BE28428E@busybox.osuosl.org>
 <CAJ4jsaf1JwSsi_frDxm_sJt28tP1UJ7xJ-s0CKWRFS3J9w+DNg@mail.gmail.com>
Message-ID: <6d2913d1-485e-8d6c-6d74-ee8af038871b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/08/2019 12:57, Carlos Santos wrote:
> Arnout,
> 
> On Wed, Aug 21, 2019 at 6:41 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>> commit: https://git.buildroot.net/buildroot/commit/?id=335c77b667c68975b65edd0ac0d6ec214a9cb1c6
>> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next
>>
>> The findmount and lsblk utilities need udev to work correctly but cannot
>> be built with udev support because the packages providing libudev (eudev
>> and systemd) depend on util-linux, creating a chicken-egg problem. Solve
>> it by means of the following changes:
> 
> Thank you for taking care of this. I have been very busy these days
> and was unable to pay attention to Buildroot.

 Argh, no, I *didn't* take care of it! This was pushed accidentally...

 Apparently my script that should warn me about such a situation doesn't work
that well :-(.


 Peter, Thomas, how should we handle this? The patch is OK as is (though TBH I
didn't test it that carefully), however I think there is a better way that needs
only a single additional package instead of two.

 So we can either revert and re-apply later, or we can keep it as is and fix it
up. In the latter case, we have to do the fix relatively quickly, because the
util-linux-programs package would be removed again...

 Maybe I should by the bullet and do some actual Buildroot development this
evening :-)

 Regards,
 Arnout
