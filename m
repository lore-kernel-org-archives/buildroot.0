From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 8 May 2017 22:31:00 +0200
Subject: [Buildroot] [PATCH 2/2] package/ltp-testsuite: disable for sparc
In-Reply-To: <20170508212552.651ed63b@free-electrons.com>
References: <20170508190819.28493-1-romain.naour@gmail.com>
 <20170508190819.28493-2-romain.naour@gmail.com>
 <20170508212552.651ed63b@free-electrons.com>
Message-ID: <dfb284aa-556a-e072-6901-75e45f0a8762@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 08/05/2017 ? 21:25, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Mon,  8 May 2017 21:08:19 +0200, Romain Naour wrote:
> 
>> +	# missing __sync_*() family of functions
>> +	depends on !BR2_sparc
> 
> This is wrong: we have BR2_TOOLCHAIN_HAS_SYNC_xyz symbols for this.
> Sparc is not the only architecture affected.

I was able to build ltp-testsuite with the following config where none of
BR2_TOOLCHAIN_HAS_SYNC_* are set:

BR2_arcle=y
# BR2_ARC_ATOMIC_EXT is not set
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_PACKAGE_LTP_TESTSUITE=y

Other architecture are not available due to toolchain dependencies

So It's seems related to sparc.

I tested with test-pkg to discover these two build issues.

Best regards,
Romain

> 
> Thomas
> 
