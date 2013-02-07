From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 7 Feb 2013 17:48:13 +0100
Subject: [Buildroot] [PATCH 3/8] package/Makefile.in: update/fix
	HOST_PATH variable
In-Reply-To: <20130207092751.61fd256a@skate>
References: <cover.1356907750.git.s.martin49@gmail.com>
 <d29120e810fb080ac4304d6e51b01ec2efda168f.1356907750.git.s.martin49@gmail.com>
 <20130207092751.61fd256a@skate>
Message-ID: <CAHXCMMJ41KL-3rggGZ2FtrW=B=ww-tuYW8qcoPfOT0k+qegJVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2013/2/7 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Samuel Martin,
>
> On Sun, 30 Dec 2012 23:54:10 +0100, Samuel Martin wrote:
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
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
>>  HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib
>> -Wl,-rpath,$(HOST_DIR)/usr/lib
>> -HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
>> +HOST_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
>>  # hostcc version as an integer - E.G. 4.3.2 => 432
>>  HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
>
> I am ok with the patch, and also your 4/8, but I really believe you
> should be more verbose in the commit log. Here the only information is
> "update/fix HOST_PATH variable".
I agree and I may be more guilty than anyone else since I regularly
ask for more details. ;)

> But why? What is the reason? What are
> the impacts? It is especially true when we look at those patches with a
> little bit of delay as is the case now.
Well, I think I already answered this:
http://lists.busybox.net/pipermail/buildroot/2012-December/064434.html

I planned to re-spin part of the serie, but would like some inputs to
the question:
"do we need 2 distinct variables for this?"

So, meanwhile, if you prefer merge this patch as is (with a commit
message more verbose), tell me, I'll repost it shortly.

Regards,


-- 
Samuel
