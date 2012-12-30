From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Dec 2012 23:41:15 +0100
Subject: [Buildroot] [PATCH 3/8] package/Makefile.in: update/fix
	HOST_PATH variable
In-Reply-To: <20121230231115.7fefabb7@skate>
References: <cover.1356903063.git.s.martin49@gmail.com>
 <0a056ec61043dcada1eab6ab7e7ec4de25743bfd.1356903063.git.s.martin49@gmail.com>
 <20121230231115.7fefabb7@skate>
Message-ID: <CAHXCMMK-=5PU4rvm4=DrN=UP_A120kOAM-Ys4H3mifd3O2UePA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

2012/12/30 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Samuel Martin,
>
> On Sun, 30 Dec 2012 22:33:27 +0100, Samuel Martin wrote:
>> ---
>>  package/Makefile.in | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index cc8f320..dd04e25 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -165,7 +165,7 @@ HOST_CFLAGS   ?= -O2
>>  HOST_CFLAGS   += $(HOST_CPPFLAGS)
>>  HOST_CXXFLAGS += $(HOST_CFLAGS)
>>  HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
>> -HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
>> +HOST_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
>
> Why?

Well, honestly, to keep things consistent with TARGET_PATH...

We can also wonder why TARGET_PATH contains $(HOST_DIR)/usr/sbin? or
whether it is needed/used in TARGET_PATH?
I can do the other way, removing $(HOST_DIR)/usr/sbin from both
TARGET_PATH and HOST_PATH.

Also, TARGET_PATH and HOST_PATH store pretty much the same things...
do we need 2 distincts variables?

BTW, AFAICS nothing is installed in $(HOST_DIR)/bin...
And some binaries from $(HOST_DIR)/usr/sbin which could be used by
some post-build scripts, but I doubt HOST_PATH or TARGET_PATH are
correctly exported when post-build scripts are executed.


>
> For such core changes, a commit message of "update/fix something" is
> definitely not enough. A detailed explanation is needed.
Agreed.

Regards,

-- 
Samuel
