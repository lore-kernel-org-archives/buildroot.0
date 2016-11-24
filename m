From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Nov 2016 09:01:08 +0100
Subject: [Buildroot] [PATCH/next] toolchain-external: support gcc < 4.3
In-Reply-To: <31d9d115-a051-8c3d-efae-6225423ba481@mind.be>
References: <20161123111404.20661-1-arnout@mind.be>
 <20161123232132.66194af8@free-electrons.com>
 <31d9d115-a051-8c3d-efae-6225423ba481@mind.be>
Message-ID: <20161124090108.4662368c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Nov 2016 00:38:33 +0100, Arnout Vandecappelle wrote:
> On 23-11-16 23:21, Thomas Petazzoni wrote:
> [snip]
> >> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> >> index 3991bc1..72e7292 100644
> >> --- a/toolchain/helpers.mk
> >> +++ b/toolchain/helpers.mk
> >> @@ -145,8 +145,7 @@ check_kernel_headers_version = \
> >>  check_gcc_version = \
> >>  	expected_version="$(strip $2)" ; \
> >>  	if [ -z "$${expected_version}" ]; then \
> >> -		printf "Internal error, gcc version unknown (no GCC_AT_LEAST_X_Y selected)\n"; \
> >> -		exit 1 ; \
> >> +		exit 0 ; \  
> > 
> > Why?  
> 
>  As stated in the commit log:
> 
> When [BR2_TOOLCHAIN_GCC_AT_LEAST] is
> empty, we don't do a version check at all in check_gcc_version.
> 
>  Perhaps I should add to that "(previously we errored out)".

Well, we're still erroring out, but with a 0 exit code. So I must be
missing something.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
