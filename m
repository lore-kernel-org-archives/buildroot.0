From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Oct 2014 18:32:27 +0200
Subject: [Buildroot] [PATCH] luaposix: Use github call
In-Reply-To: <20141012182946.7db59593@free-electrons.com>
References: <1413131033-26185-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20141012182946.7db59593@free-electrons.com>
Message-ID: <CAGduivyBdKHyP1RiLVdz4=dagQVrFDArekCf7pHQ9vyF6bTNAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 12, 2014 at 6:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
>
> On Sun, 12 Oct 2014 18:23:53 +0200, Maxime Hadjinlian wrote:
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>>  package/luaposix/luaposix.mk | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
>> index 46723a0..13fc266 100644
>> --- a/package/luaposix/luaposix.mk
>> +++ b/package/luaposix/luaposix.mk
>> @@ -5,8 +5,7 @@
>>  ################################################################################
>>
>>  LUAPOSIX_VERSION = 32
>> -LUAPOSIX_SITE = https://github.com/luaposix/luaposix/archive
>> -LUAPOSIX_SOURCE = release-v$(LUAPOSIX_VERSION).tar.gz
>> +LUAPOSIX_SITE = $(call github,luaposix,luaposix,release-v$(LUAPOSIX_VERSION))
>>  LUAPOSIX_LICENSE = MIT
>>  LUAPOSIX_LICENSE_FILES = COPYING
>>  LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
>
> Why would we want to use git instead of a simple tarball?
We are using the tarball, they both came from the space place.
Only we are using the github helper call, which shield us from any
change on github part.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
