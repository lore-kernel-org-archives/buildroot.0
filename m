From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Tue, 28 Oct 2014 12:13:37 +0100
Subject: [Buildroot] [PATCH v2] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <1414403734.3666.18.camel@abrodkin-8560l.internal.synopsys.com>
References: <1413132543-7148-1-git-send-email-abrodkin@synopsys.com>
 <CABbD_XBjo-UJf95vFi5innY4db=CzKDLeKqgXSsmEsf7eWw5yw@mail.gmail.com>
 <1413560410.19660.5.camel@abrodkin-8560l.internal.synopsys.com>
 <CABbD_XAv=+=zGo4mOkuCRCd9ay4TPyuuU0P_N8hLT0=UZL-PZQ@mail.gmail.com>
 <1414403734.3666.18.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <CABbD_XDezjPbabeENKYshsdUMKJj-2ED8sjUDS9QJWiSv2rfqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey

> make both
> > linux and linux-headers depend on it?
>
> Well, frankly I don't quite understand how to do this kind of 2 stage
> variables resolution with "make".
>
I meant adding a dummy target, like linux-paths, that calculates the
variables, and both linux and linux-headers
as targets would depend on it.
I'm not sure if this is possible without the much ugly hacks, so I just
evaluating right now.
My other idea is to use a Makefile function for calculation and call the
function from both places.


> Probably another approach could be to eliminate "linux-headers" package
> completely and modify "linux" virtual package so it could be only
> downloaded, extracted and headers-installed if user doesn't want to
> build kernel itself. I.e. move all functionality of "linux-headers" to
> "linux".
>
> But then we'll need to migrate kernel version (well headers version)
> functionality as well so we still have properly resolved dependencies
> for packages which require headers newer than XXX.
>
> In other words scope of work here looks like pretty significant (if done
> properly) but benefits are not that obvious.
>
Probably you're right. Maybe this will have use in the future, but only if
using a Buildroot toolchain
built with the system.


>
> Because IMHO the only reason you may want to use the same
> sources/headers for tools and kernel if there is a ABI breakage which
> for most of modern architectures not feasible.
>
> Existing architectures seem to not suffer from it - their ABIs are
> stable for quite a long time and new architectures are forced to use
> UAPI so most of things will be unified.
>
True, I just think it's a much cleaner and more elegant approach to use the
same sources for headers and kernel
if using a custom kernel (and not just adding patches at compile time with
BR2_LINUX_KERNEL_PATCH to vanilla)
and own toolchain.


>
> Still if you do need this functionality nobody may stop you from trying
> and I'll happily help you with details, reviews, tests etc.

Thank you!

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141028/a85b8773/attachment.html>
