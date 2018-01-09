From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Tue, 9 Jan 2018 11:23:12 -0800
Subject: [Buildroot] [PATCH] glibc: ARC is now supported via patches
In-Reply-To: <20180109155057.659c646b@windsurf>
References: <20171109215821.16615-1-abrodkin@synopsys.com>
 <20180101123936.609b7f41@windsurf> <1515506414.3868.7.camel@synopsys.com>
 <20180109155057.659c646b@windsurf>
Message-ID: <cfc03ae2-7a3a-bbd9-70ff-fb067e8235a0@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/09/2018 06:51 AM, Thomas Petazzoni wrote:
>> That's very unfortunate but looks like we're not going to make ARC glibc port
>> accepted before the upcoming release.
> Gah, too bad :-/

FWIW, the blocker is need to use upstream components (gcc/binutils). So a glibc 
toolchain off of upstream gcc/binutils as well as upstream gcc 7.2 yields a 
working system, the glibc test suite built against has 100+ failures (mostly 
related to unwinding / cancelation) which is not acceptable to upstream glibc 
folks. So the issue is more in the tooling than the glibc pot per se.

-Vineet
