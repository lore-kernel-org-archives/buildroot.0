From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Sep 2013 10:41:55 -0300
Subject: [Buildroot] [PATCH] nommu/flat: build packages with the correct
 FLAGS
In-Reply-To: <20130911154013.1dee2f28@skate>
References: <1378904024-14607-1-git-send-email-gustavo@zacarias.com.ar>
 <20130911154013.1dee2f28@skate>
Message-ID: <52307323.6050400@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/11/2013 10:40 AM, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
> 
> On Wed, 11 Sep 2013 09:53:44 -0300, Gustavo Zacarias wrote:
> 
>>  ifeq ($(BR2_BINFMT_FLAT),y)
>> +TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
>> +	-Wl$(comma)-elf2flt)
> 
> Nitpicking, can't this be written:
> 
> TARGET_CFLAGS += -Wl$(comma)-elf2flt$(if $($(PKG)_FLAT_STACKSIZE),=-s$($(PKG)_FLAT_STACKSIZE))
> 
> not sure if it's more readable though.

Yes very likely, but i went for readable :)
If the FLAT support is extended there may be other options appended
there and separate clauses will be likely/better to avoid duplication
and general uglyness.
Regards.
