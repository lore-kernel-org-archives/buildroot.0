From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 Sep 2014 09:53:40 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140912101105.1e932cb8@free-electrons.com>
References: <20140912063012.AF99B100DEE@stock.ovh.net>
 <20140912101105.1e932cb8@free-electrons.com>
Message-ID: <5412B494.4070607@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/12/2014 09:11 AM, Thomas Petazzoni wrote:
>>        mips |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/04de887fd501e1a1b9f811dacdf17596256097e6/
>>      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/91c0413e755c365332bc15d1d69ab3d6160ae78c/
>
> Vicente, I think you looked into one of the two issues. Can you look at
> the other one, and send the corresponding patches?

One of them (sa_restorer) is very close to be fixed upstream. Maybe 
today? Hopefully.

To fix the other one (si_timerid) we need to patch uClibc, but that 
patch will add some members to a struct, so that woulb be an ABI 
breakage. We need to talk first to the person in maintaining uClibc for 
MIPS and see what he thinks about this.

-- 
Vincent
