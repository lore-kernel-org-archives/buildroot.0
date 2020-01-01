From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 1 Jan 2020 17:00:01 +0100
Subject: [Buildroot] [PATCH] package/proj: fix build failure due to gcc
 bug 68485(C++)
In-Reply-To: <20200101165417.37ed565d@windsurf>
References: <20191231150957.122179-1-giulio.benetti@benettiengineering.com>
 <20200101165417.37ed565d@windsurf>
Message-ID: <4ceb6ec2-4908-ad5b-b126-e7cfd21b390c@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1/1/20 4:54 PM, Thomas Petazzoni wrote:
> On Tue, 31 Dec 2019 16:09:57 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> +PROJ_CXXFLAGS = $(TARGET_CXXFLAGS)
>> +
>> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
>> +PROJ_CXXFLAGS += -O0
>> +endif
>> +
>> +PROJ_CONF_ENV += CXXFLAGS="$(PROJ_CXXFLAGS)"
> 
> The duplication of the condition was really not necessary, you can use
> the same condition to tweak the CFLAGS/CXXFLAGS values.

Oops, you're right.

> I've adjusted that and applied. Thanks!

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
