From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Mon, 29 Jun 2015 12:01:51 -0300
Subject: [Buildroot] [PATCH v3 0/4] Add ARM Cortex-M3 support
In-Reply-To: <20150628143454.2b895956@free-electrons.com>
References: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
 <20150628143454.2b895956@free-electrons.com>
Message-ID: <20150629150151.GA10554@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jun 28, 2015 at 02:34:54PM +0200, Thomas Petazzoni wrote:
> Dear Guido Mart?nez,
> 
> On Fri, 26 Jun 2015 14:33:18 -0300, Guido Mart?nez wrote:
> >   toolchain: introduce BR2_TOOLCHAIN_HAS_RESOLVER
> >   toolchain-external: add OSELAS 2014.12.0 Cortex-M3 toolchain
> 
> There have been some comments from Yann on these patches, so I've
> marked them as "Changes Requested" in patchwork. Could you rework them
> as suggested by Yann, and resend updated versions?
Yes, will do! I agree with Yann in removing nslookup from the default
busybox config. I think that's easier for everyone.

> Also, now that there is Cortex-M3 support listed, please make sure it
> works fine with the internal toolchain backend, and if it doesn't work,
> add the appropriate exceptions (for example, glibc and musl cannot be
> built for Cortex-M3, as far as I know). Can you send a follow-up patch
> for this?
Right, it doesn't work right now since there are a few places that force
the selection of ARM instructions where Thumb is not available, and that
won't work on M3. I'll try to fix it and get back.

Thanks!

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
