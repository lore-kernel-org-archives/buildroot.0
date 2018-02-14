From: Mark Hirota <markhirota@gmail.com>
Date: Wed, 14 Feb 2018 06:48:36 -0800
Subject: [Buildroot] [PATCH 1/1] cmake: bump version to 3.10.2 and add
 license hash
In-Reply-To: <20180213232538.0441c65a@windsurf.lan>
References: <20180213195729.33644-1-markhirota@gmail.com>
 <20180213232538.0441c65a@windsurf.lan>
Message-ID: <6AE94196-F3D3-4887-BC12-EDBA8A3A4AA3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you for providing that patchwork link, as it provides excellent background on this.  It seems that the build failures you?re referring to can only be seen once a change occurs on master?

Perhaps I should submit a patch for cmake 3.9.6 instead? This is because my goal is to have support for LTO the or CMAKE_INTERPROCEDURAL_OPTIMIZATION variable.

Thanks,
?M
> On Feb 13, 2018, at 2:25 PM, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> Hello,
> 
>> On Tue, 13 Feb 2018 11:57:29 -0800, Mark Hirota wrote:
>> Signed-off-by: Mark Hirota <markhirota@gmail.com>
>> ---
>> package/cmake/cmake.hash | 5 +++--
>> package/cmake/cmake.mk   | 2 +-
>> 2 files changed, 4 insertions(+), 3 deletions(-)
> 
> Thanks for this contribution. However, I'm a little bit worried by this
> bump: it was already submitted before, and we had to revert because it
> was causing gazillions of build failures.
> 
> See https://patchwork.ozlabs.org/patch/846757/. Basically, unless CMake
> fixed the problem, CMake now requires C++11 to build, which is
> annoying, as not all environments where Buildroot is used have a C++11
> capable host compiler.
> 
> Could you check the status of the emplace_hint() method usage? Has it
> been made conditional?
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com
