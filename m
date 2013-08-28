From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 28 Aug 2013 13:31:38 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20130828090812.43a7f849@skate>
References: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
 <20130828090812.43a7f849@skate>
Message-ID: <CAAXf6LXqi=BWZ6dovZS3HEfCZbr5DbECvQLJCwOH94Ax=P_z9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Aug 28, 2013 at 9:08 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> We don't have that many build failures today, so let's have a look
> together at each of them and see what we can do about them.

Good idea! Ideally we can get them to 0, so that from that point
onwards any autobuild failure becomes a clear focus point.

[snip]

>
>>    powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/7bcab9b94a81b89789dc1cabe9f6940ed4f5ea51/
>
> Too old kernel headers in toolchain. Options:
>
>  1/ Add an exception in the autobuilder script.
>
>  2/ Modify media-ctl to integrate the necessary kernel headers and use
>     them when not available from the toolchain.
>
> I'm inclined to favor 1/.

I once took a look at this. The media-ctl package already has some
copies of kernel headers to deal with older kernels. There was a check
in configure to detect this, IIRC. The stupid thing was that the
headers in the media-ctl sources would be applied unconditionally.
My intent was to patch media-ctl to provide also this missing header,
and cleanup the stupidity described. Unfortunately I didn't continue
this yet.

What exactly do you mean with approach 1/? Forcing a recent kernel
when building media-ctl?
That doesn't solve the problem for other users that try to enable
media-ctl on older kernels, right?

Best regards,
Thomas
