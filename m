From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Tue, 22 Dec 2015 19:26:20 +0200 (IST)
Subject: [Buildroot] [PATCH 1/1] new packages: yp-tools, ypbind-mt
In-Reply-To: <20151221165856.41945d9e@free-electrons.com>
References: <1450707537-30154-1-git-send-email-yba@tkos.co.il>
 <1450707537-30154-3-git-send-email-yba@tkos.co.il>
 <20151221165856.41945d9e@free-electrons.com>
Message-ID: <alpine.DEB.2.11.1512221919400.15569@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Dec 2015, Thomas Petazzoni wrote:

> Date: Mon, 21 Dec 2015 16:58:56 +0100
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 1/1] new packages: yp-tools, ypbind-mt
> 
> Dear Jonathan Ben-Avraham,
>
> On Mon, 21 Dec 2015 16:18:57 +0200, Jonathan Ben-Avraham wrote:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>> Adds the yp-tools and ypbind-mt packages required to use NIS and to
>> use NFS autofs-mounted partitions.

[snip]

>> diff --git a/package/yp-tools/yp-tools.mk b/package/yp-tools/yp-tools.mk
>> new file mode 100644
>> index 0000000..707da49
>> --- /dev/null
>> +++ b/package/yp-tools/yp-tools.mk
>> @@ -0,0 +1,32 @@
>> +################################################################################
>> +#
>> +# yp-tools
>> +#
>> +################################################################################
>> +
>> +YP_TOOLS_VERSION = yp-tools-3_4
>> +YP_TOOLS_SITE = $(call github,thkukuk,yp-tools,$(YP_TOOLS_VERSION))
>> +YP_TOOLS_LICENSE = GPLv2+
>> +YP_TOOLS_LICENSE_FILES = COPYING
>> +YP_TOOLS_AUTORECONF = YES
>> +YP_TOOLS_DEPENDENCIES = host-pkgconf
>> +YP_TOOLS_PRE_CONFIGURE_HOOKS += YP_TOOLS_LOCAL_MAPV4V6ADDR_H
>> +
>> +# From: Joe MacDonald <joe_macdonald@mentor.com>
>> +# +Date: Fri, 27 Feb 2015 12:04:10 -0500
>> +# +Subject: [PATCH] ipv4/ipv6: Provide an in-place version of mapv4v6addr.h
>> +# +
>> +# +mapv4v6addr.h isn't always available, depending on your build, but
>> +# +nis-hosts.c only needs it for a single, inline function.  So drop a copy
>> +# +here rather than playing games with the include path that would
>> +# +potentially lead to cross-compilation issues.
>> +# +
>> +# +Upstream-status: Inappropriate [embedded specific]
>> +# +
>> +# +Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>

[snip]

> But it seems like a lot of complexity for just one function. Why don't
> you simply copy/paste this code into a patch for the nis-hosts program ?

Hi Thomas,
The reason is that a newer version of nis-hosts could break a patch but 
the include file will not break. At worst it will be redundant. I wanted 
to avoid having to maintain the patch over version changes.

  - yba


[snip]
>
> Thomas
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
