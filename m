From: Nathaniel Roach <nroach44@nroach44.id.au>
Date: Tue, 4 Feb 2020 18:01:44 +0800
Subject: [Buildroot] [PATCH 1/2] package/liboping: remove -Werror build
 flag
In-Reply-To: <87a75z1im0.fsf@dell.be.48ers.dk>
References: <20200124143609.14313-1-nroach44@gmail.com>
 <CAPi7W81yAtkC3xJPL++Lb-ZP=5yja0KRy00t3ALdp2Q4EGFv6g@mail.gmail.com>
 <cfe054c8-2874-de9a-a604-763b3157e4d3@nroach44.id.au>
 <CAPi7W80DpRDJJ04Mg6rb+4yoRLVdGbw7tyk0+J4xrDAtzz3h=g@mail.gmail.com>
 <87a75z1im0.fsf@dell.be.48ers.dk>
Message-ID: <339c075e-0764-574b-5e03-8b27342427b5@nroach44.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Peter, Fabrice,

On 4/2/20 5:11 am, Peter Korsgaard wrote:
>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
> Hi,
>
>   >> > Can you be more specific on the build failure? For example, by
>   >> > providing a link on autobuilder?
>   >> > Otherwise, I would prefer an upstreamable solution such as adding a
>   >> > --disable-werror option or adding a patch that fixes the issue.
>   >> > There is a pending PR on a truncation error on upstream github:
>   >> > https://github.com/octo/liboping/pull/50.
>   >> > Is it related to your build failure? In this case, I would suggest to
>   >> > retrieve this commit.
>   >>
>   >> The error is detailed in the Gentoo bug linked above, and this was their
>   >> fix for it. There is one single build failure on the autobuilders, and
>   >> it's got the same error:
>   >> http://autobuild.buildroot.org/?reason=liboping-1.10.0
>   > This error was raised in December 5th 2018 and has been fixed by
>   > retrieving an upstream commit instead of disabling -Werror (see
>   > https://patchwork.ozlabs.org/patch/1009066).
>   > There was no more autobuilder failures after this patch was applied.
>   > So this is strange that you still get a failure on your local machine.
>   > Are you using the master branch or one of the official release (fix
>   > was committed to 2018.08.x and 2018.11.x releases)?
>
> Any comments on that? In the mean time I have marked the patch as not
> applicable in patchwork.

Apologies for the delays, I'm going to have to test with the BR 
toolchain instead of my ct-ng one.
