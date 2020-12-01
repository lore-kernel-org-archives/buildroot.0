From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Dec 2020 22:47:35 +0100
Subject: [Buildroot] [PATCH/next v1] package/kmsxx: bump version to
 5489056 and convert to meson build
In-Reply-To: <20201201223807.2c4ee4c0@gmx.net>
References: <20201129175633.388-1-ps.report@gmx.net>
 <20201201223807.2c4ee4c0@gmx.net>
Message-ID: <0d0a9b5c-afba-b186-a71d-64a485950da9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/12/2020 22:38, Peter Seiderer wrote:
>>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>> -KMSXX_CXXFLAGS += -O0
>> +KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
> '=' (instead of '+=') should be enough...

 Even if that is true, it's actually pretty convenient to have += everywhere,
because you don't have to care about the order of things when adding new CXXFLAGS.

 Regards,
 Arnout
