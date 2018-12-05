From: Christian Stewart <christian@paral.in>
Date: Wed, 5 Dec 2018 14:39:03 -0800
Subject: [Buildroot] Docker client does not function correctly in 2018.11
In-Reply-To: <8dcf0b32c7fe49e8b30b10a482f3f23a@exitstrategytech.com>
References: <ac041379a2d04fbeb3900fae7bab51be@exitstrategytech.com>
 <8dcf0b32c7fe49e8b30b10a482f3f23a@exitstrategytech.com>
Message-ID: <CA+h8R2pH=BTTh+farCMfJOW8dzYsUhN_ompMtc=Aaz4tQVbVXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David,

On Wed, Dec 5, 2018, 2:04 PM David J. Fogle <Dave@exitstrategytech.com>
wrote:

> I have investigated further, and narrowed the issue down to the
> containerd, not the client. The containerd is being passed an invalid flag
> -metrics-interval, and is constantly looping through it's init process.
>

Thank you for looking into this. We are also aware of a hang in docker
startup due to random data starvation.

Could you please try either the "skiff" branch of
https://github.com/paralin/buildroot.git or apply this patch:
https://patchwork.ozlabs.org/patch/1003677/

There was a commit merged as part of that series to bump containerd to a
newer version. However, the docker engine bump from that series did not get
merged until after the 2018.11 release window (the series was originally
intended to be merged all at once). It's likely there is some
incompatibility in startup flags as you say between the two containerd and
docker versions present.

I recommend to revert the containerd bump in 2018.11 or backport the docker
engine bump.

Best regards,
Christian

>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181205/84b56138/attachment.html>
