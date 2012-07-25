From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Jul 2012 18:25:25 +0200
Subject: [Buildroot] [PATCH 07/11] ext-tool.mk: add fancy messages
In-Reply-To: <20120722162641.6bd3eeef@skate>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
 <1342963719-1810-8-git-send-email-s.martin49@gmail.com>
 <20120722162641.6bd3eeef@skate>
Message-ID: <50101DF5.2030902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/22/12 16:26, Thomas Petazzoni wrote:
> Le Sun, 22 Jul 2012 15:28:35 +0200,
> Samuel Martin<s.martin49@gmail.com>  a ?crit :
>
>>
>> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
>>
>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>> index 293bf4f..0861673 100644
>> --- a/package/pkg-utils.mk
>> +++ b/package/pkg-utils.mk
>> @@ -65,6 +65,7 @@ INFLATE.tar  = cat
>>
>>   # MESSAGE Macro -- display a message in bold type
>>   MESSAGE     = echo "$(TERM_BOLD)>>>  $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
>> +MESSAGE2    = echo "$(TERM_BOLD)>>>  $(1) $(2)$(TERM_RESET)"
>>   TERM_BOLD  := $(shell tput smso)
>>   TERM_RESET := $(shell tput rmso)
>
> Maybe we need:
>
> MESSAGE	= echo "$(TERM_BOLD)>>>  $(1) $(2)$(TERM_RESET)"
> PKG_MESSAGE = $(call MESSAGE,$($(PKG)_NAME) $($(PKG)_VERSION),$(1))
>
> And then use PKG_MESSAGE in the package infrastructure, and MESSAGE in
> other places. But definitely MESSAGE vs. MESSAGE2 is ugly.

  +1 for that.


> And maybe the MESSAGE definition would have to be somewhere outside of
> pkg-utils.mk since it's not package related anymore.

  In fact everything in pkg-* is not strictly package-related anymore, since
it's also used by bootloaders and kernel, and download helpers are also used
by the external toolchains.  So if we start moving stuff around, probably
everything should just go into e.g. support/make/

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
