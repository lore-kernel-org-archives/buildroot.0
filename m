From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jul 2016 13:14:58 +0200
Subject: [Buildroot] [PATCH v2 03/15] package/Makefile.in: set
 TARGET_FCFLAGS variables
In-Reply-To: <20160701225954.65130be1@free-electrons.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-4-s.martin49@gmail.com>
 <20160701225954.65130be1@free-electrons.com>
Message-ID: <c87329b9-a931-5abb-2616-c2c27fa05bdb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-07-16 22:59, Thomas Petazzoni wrote:
>>  ifeq ($(BR2_BINFMT_FLAT),y)
>> @@ -148,29 +149,36 @@ TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FL
>>  	-Wl$(comma)-elf2flt)
>>  TARGET_CXXFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
>>  	-Wl$(comma)-elf2flt)
>> +TARGET_FCFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
>> +	-Wl$(comma)-elf2flt)
>>  TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt)
>>  endif
>>  
>>  ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
>>  TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
>>  TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
>> +TARGET_FCFLAGS += -mid-shared-library -mshared-library-id=0
>>  TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
> 
> [...]
> 
> There's really a lot of duplication between all those definitions, so
> maybe one day we should clean this up. I'm also not a big fan of the
> TARGET_ABI variable, but that's really unrelated to this patch.

 IMHO this stuff should go into the toolchain wrapper.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
