From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Feb 2019 09:39:47 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-02-13
In-Reply-To: <20190214100244.GB15212@momiji>
References: <20190214070044.6825F2152B@silver.osuosl.org>
 <20190214100244.GB15212@momiji>
Message-ID: <20190214093947.3949384d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Feb 2019 10:02:44 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> On Thu, 14 Feb 2019 07:00:39 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> > [...]
> >
> > microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/1b6e6c5fddf3538ed7f150294c3d8fa94b3e4c59 |       
> 
> This seems to be the following upstream GCC bug:
> 
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=78380
> 
> and likely related to this other one reported by Thomas:
> 
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69401
> 
> Apparently GCC 8.x does not have the issue, so I wonder if it would make
> sense to add a depends on BR2_TOOLCHAIN_GCC_AT_LEAST_{8 or 7} in the brotli
> package when the target is Microblaze.

Did you verify that the issue is fixed with gcc 7.x or gcc 8.x ?

> Only woff2 need brotli (libcurl has an optional dependency), and woff2
> itself is only used by WebKit for Web fonts, and if WOFF2 support is at
> build time in WebKit the rest of Web fonts formats (WOFF1, TTF, etc.)
> still work fine, so I think the disruption would be minimal.
> 
> Does the above sound reasonable to do?

Yes, if the issue no longer happens with gcc >= 7.x, it seems like a
reasonable option.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
