From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 08:49:54 +0100
Subject: [Buildroot] [PATCH] kvm-unit-test: revert use of RDSEED and
 RDRAND
In-Reply-To: <CANQCQpaDCyJLRZRk5mwun3sGy1Ex7WVZO5E35YZM02m-Synv-g@mail.gmail.com>
References: <20171207043631.9312-1-matthew.weber@rockwellcollins.com>
 <20171214094459.4b383336@windsurf.png.is.keysight.com>
 <CANQCQpaDCyJLRZRk5mwun3sGy1Ex7WVZO5E35YZM02m-Synv-g@mail.gmail.com>
Message-ID: <20171218084954.54776e85@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Dec 2017 14:41:05 -0600, Matthew Weber wrote:

> It isn't really a bug upstream.  I think the long term fix would be a
> check for a minimum binutils version.

Or kvm-unit-tests could do a configure test to verify if
rdseed/rdrand are supported, and only use them if so.

> Can you think of another case I could use as an example where a
> evolution in the binutils has required a minimum version?

I don't think we had such a case so far. We do have
BR2_TOOLCHAIN_BINUTILS_HAS_BUG_xyz, but I don't think we have had
version dependencies for binutils.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
