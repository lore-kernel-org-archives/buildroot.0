From: Christian Stewart <christian@paral.in>
Date: Tue, 12 Feb 2019 01:14:21 -0800
Subject: [Buildroot] [PATCH 1/1] go: explicitly disable modules to avoid
 unintended network lookup
In-Reply-To: <20190126102355.24766-1-christian@paral.in>
References: <20190126102355.24766-1-christian@paral.in>
Message-ID: <87va1pgyhe.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anisse,

Christian Stewart <christian@paral.in> writes:
> Go "modules" refers to the dependency fetching, verification (hashing), and
> version control system built into Go as of 1.11.
>
> In the absence of the GO111MODULE environment variable, the Go compiler will
> correctly compile using the "vendor" version of dependencies downloaded by
> Buildroot during the compilation process for Go-based packages.

You suggested instead setting GOPROXY=off, this would not have the
intended effect.

It is indeed correct to disable modules altogether as this patch does.
Disabling modules is not something that breaks Go or hinders it in any
way. It simply disables the versioning and network dependency fetch
mechanism. This is the correct approach to ensuring that the Go compiler
will always use the vendor and gopaths correctly as set up by the
Buildroot build system.

I still recommend to merge this patch as is.

Best,
Christian 
