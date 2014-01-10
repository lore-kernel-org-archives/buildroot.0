From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Jan 2014 10:10:50 +0000
Subject: [Buildroot] [PATCH 1/2] uclibc: add a missing function member
 to siginfo.h
In-Reply-To: <20140110153615.34044994@skate>
References: <1389202364-19387-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140109104043.02d07109@skate> <52CE6FE5.9070305@imgtec.com>
 <20140110153615.34044994@skate>
Message-ID: <52CFC72A.3010907@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/10/2014 07:36 AM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Thu, 9 Jan 2014 09:46:13 +0000, Vicente Olivert Riera wrote:
>
>> Yes, I understand what you mean, but what do you want to do? I mean, if
>> uClibc don't release new version, aren't you going to upgrade external
>> toolchains anymore?
>
> Depends on which external toolchains we're talking about. In the
> autobuilders, there are various external toolchains that are in use.
> Amongst the uClibc based ones, we have:
>
>   * Toolchains built using Buildroot itself. These are not very
>     problematic, as I can rebuild them when a new version of Buildroot
>     containing useful backported uClibc patches is released. Though it'd
>     be great if I wasn't forced to rebuild these toolchains too often.
>
>   * Toolchains built using Crosstool-NG. Those will *not* contain the
>     backported uClibc patches that we have in Buildroot. There is a lot
>     less uClibc patch backporting activity going on in Crosstool-NG, if
>     any.
>
>   * Toolchains coming from vendors, such as the Analog Devices
>     toolchain. There's nothing we can do about them.
>
> Therefore, having Buildroot packages relying on so many backported
> uClibc patches is getting more and more problematic.
>
>> I think we should fix this for the Buildroot toolchain, because is "our"
>> toolchain and is "our" problem. If external toolchains don't apply those
>> patches, then that will be their problem. They can upgrade the toolchain
>> packaging uClibc to a git version number, so no releases is needed. Of
>> course I understand that having a release is better because that means
>> that the state is consistent, it shouldn't fail, has been tested, etc.,
>> but if that's not happening, again, is not our problem.
>
> I think this is completely the wrong way of seeing things. Buildroot's
> policy is that we should deviate as little as possible from upstream.
> We don't have the man-power to maintain our own set of crazy patches on
> top of this or that component. Whenever someone wanted to post patches
> adding features to this or that component, we've always rejected them,
> and encouraged the contributor to get them merged in the upstream
> component instead.
>
> I think it should be the same with uClibc. If some package doesn't work
> with an uClibc release, then we should simply exclude this package
> entirely from being built with any uClibc toolchain. And if people are
> not happy with that, then they should either engage with the
> upstream uClibc to ensure that they do releases at reasonable
> intervals, or they should realize that uClibc is a near-dead project,
> and therefore that switching to another C library probably makes sense.
>
> Best regards,
>
> Thomas
>

Hello Thomas.

So I understand that your suggestion is to not apply uClibc patches in 
Buildroot anymore and just disable the packages (the ones that are 
failing) for the affected uClibc versions, and keep them enabled when 
the uClibc daily snapshot is selected. Am I right?

Best regards,

-- 
Vincent
