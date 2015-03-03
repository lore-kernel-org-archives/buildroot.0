From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 03 Mar 2015 07:54:42 -0300
Subject: [Buildroot] [PATCH] perl: needs host-bison
In-Reply-To: <20150303114820.32b71d7b@free-electrons.com>
References: <1425378663-2659-1-git-send-email-gustavo@zacarias.com.ar>
 <20150303114820.32b71d7b@free-electrons.com>
Message-ID: <54F592F2.80405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/03/2015 07:48 AM, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
> 
> On Tue,  3 Mar 2015 07:31:03 -0300, Gustavo Zacarias wrote:
> 
>>  define PERL_BUILD_CMDS
>> -	$(MAKE1) -C $(@D) all
>> +	PATH=$(BR_PATH) $(MAKE1) -C $(@D) all
> 
> Use $(TARGET_MAKE_ENV) instead.
> 
>>  define HOST_PERL_BUILD_CMDS
>> -	$(MAKE) -C $(@D)
>> +	PATH=$(BR_PATH) $(MAKE) -C $(@D)
> 
> and $(HOST_MAKE_ENV).

For TARGET_MAKE_ENV maybe since it's only PATH, for HOST_MAKE_ENV it's
not and it'll need extra testing to see that perl's build system doesn't
fluke with the extras.
So splitting between BR_PATH and TARGET_MAKE_ENV is possible but not
visually consistent.
Which begs the question: why do other packages use BR_PATH in the same
way as well? (without using *_MAKE_ENV)
Regards.
