From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Nov 2016 09:48:41 +0100
Subject: [Buildroot] [PATCH/next] toolchain-external: support gcc < 4.3
In-Reply-To: <1c235f78-0f40-c1f5-1ca4-c6e2661f9e33@mind.be>
References: <20161123111404.20661-1-arnout@mind.be>
 <20161123232132.66194af8@free-electrons.com>
 <31d9d115-a051-8c3d-efae-6225423ba481@mind.be>
 <20161124090108.4662368c@free-electrons.com>
 <1c235f78-0f40-c1f5-1ca4-c6e2661f9e33@mind.be>
Message-ID: <20161124094841.6f695932@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Nov 2016 09:39:13 +0100, Arnout Vandecappelle wrote:

> >> When [BR2_TOOLCHAIN_GCC_AT_LEAST] is
> >> empty, we don't do a version check at all in check_gcc_version.
> >>
> >>  Perhaps I should add to that "(previously we errored out)".  
> > 
> > Well, we're still erroring out, but with a 0 exit code. So I must be
> > missing something.  
> 
>  0 is not an error, right?

Hum, right. I think what confused me is that "exit 0" doesn't abort the
build. It exists the sub-shell started by make, with a zero exit code,
so make continues the build. I was thinking it would abort the build
completely, which is why I was confused.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
