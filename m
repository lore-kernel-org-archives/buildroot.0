From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 28 Feb 2018 13:51:11 +0100
Subject: [Buildroot] [PATCH 1/1] azmq: bump to version 1.0.2
In-Reply-To: <87vaehlj1v.fsf@dell.be.48ers.dk>
References: <20180227205125.8121-1-fontaine.fabrice@gmail.com>
 <87lgfem9h0.fsf@dell.be.48ers.dk>
 <MWHPR0601MB37534B75BE813D41A6C3920ED3C70@MWHPR0601MB3753.namprd06.prod.outlook.com>
 <87vaehlj1v.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W80ZM4ZOC8NhBvuRQWQ8ModTbnh7t7varhMpgoC4DKS8kQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter and Trent,

2018-02-28 7:33 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:
>
>  >> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com>
> writes:
>  >> Does this fix any big / security issues so it needs to go to master or
>  >> s this for next?
>
>  > The previous version of azmq will not build with the boost version in
> 2018.02-rc2.
>
>  > It does work with buildroot 2017.11.2.
>
>  > Not sure exactly where the breakage point was between those releases.
>
> Ahh, so azmq-1.0 doesn't build in 2018.02-rc3? Odd, I don't see it in
> the autobuilders.
>
From my knowledge, azmq didn't build on targets without NPTL support but
the error was tagged as a boost error:
http://autobuild.buildroot.net/?reason=boost-1.66.0.
The patch https://patchwork.ozlabs.org/patch/877238 fixed this issue.
The issue was that NPTL was wrongly selected by azmq.

I'm not aware of any other issues.

>
> --
> Bye, Peter Korsgaard
>

Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180228/31bdcac8/attachment.html>
