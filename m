From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Mar 2016 17:36:53 +1030
Subject: [Buildroot] [PATCH v2] linux-firmware: Update bnx2x firwmare
	version
In-Reply-To: <56D606DD.5010209@mind.be>
References: <874mcs9qkc.fsf@linux.vnet.ibm.com>
 <1456805852-11045-1-git-send-email-joel@jms.id.au>
 <56D606DD.5010209@mind.be>
Message-ID: <CACPK8XeaoNj_kw980s0G+VkhQjpmVY=gUFZjePT96dWHE4991Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 2, 2016 at 7:47 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 03/01/16 05:17, Joel Stanley wrote:
>> Linux kernel 4.2 moved the driver to a newer firmware version. As that
>> is our default kernel, move the firmeware to a compatable version.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>> v2: Just use the new firmware to avoid adding extra cruft to our config system
>
>  No, this is certainly not good, it fixes 4.2+ and simultaneously breaks 4.1-.

We currently exist in a situation where 4.2+ has always been broken,
as is anything below 3.18.

The current default version of the kernel is 4.4, so this change
ensures that the kernel will work for this device with buildroot.

>  What is wrong with Thomas's proposal to remove the unneeded versions in a
> post-build script?

This requires users of buildroot to be aware of the situation and
carry local configuration. I think this is less desirable than to work
out of the box.

From our project's perspective, it's easier to patch the
linux-firmware package to only copy the version we want.

> If your size is so important that 640K matters, you would
> probably anyway want to keep only one of the six binaries instead of three
> different chip revisions.

Good point. Thanks
