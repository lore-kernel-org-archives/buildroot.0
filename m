From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 27 Jun 2014 14:44:18 +0000
Subject: [Buildroot] [PATCH] uclibc: enable multiple jobs for building
In-Reply-To: <87bntelf6r.fsf@dell.be.48ers.dk>
References: <1403870844-15258-1-git-send-email-abrodkin@synopsys.com>
 <87bntelf6r.fsf@dell.be.48ers.dk>
Message-ID: <1403880257.3255.10.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, 2014-06-27 at 14:17 +0200, Peter Korsgaard wrote:
> >>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> The use of MAKE1 for uClibc dates back 10 years:
> 
> commit 8e5fb3fb4ab09b4dc04fe7cb3f7becce6514117b
> Author: Eric Andersen <andersen@codepoet.org>
> Date:   Sat Dec 11 13:01:10 2004 +0000
> 
>     Add initial BR2_JLEVEL support, with some exceptions for apps that
>     have broken 'make -j' support
> 
> So it could very well have been fixed upstream since then. How have you
> tested it?
> 

I tried parallel build for ARC with uClibc 0.9.34+ and for i586 with
uClibc 0.9.33.2.

But since uClibc tests building is broken for ARC now I double checked
it for i586 and noticed a problem.

Because of dependency on previously built .so files - mentioned as well
here -
http://git.uclibc.org/uClibc/commit/test?id=931e8391565323ed2e589c83b83a7345813a5514
we need to keep MAKE1 for uClibc tests.

Will send a re-spin shortly.

-Alexey
