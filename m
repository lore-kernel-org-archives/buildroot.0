From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 26 Dec 2014 16:03:48 +0100
Subject: [Buildroot] [PATCH 1/2] libvncserver: bump version to 0.9.10
In-Reply-To: <20141226044006.GT6400@tarshish>
References: <1419554775-11560-1-git-send-email-bos@je-eigen-domein.nl>
 <20141226044006.GT6400@tarshish>
Message-ID: <19e3ab6547ff31fb2f50e976e6ac5394@to-the-max.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26.12.2014 05:40, Baruch Siach wrote:
>> diff --git a/package/libvncserver/libvncserver.mk
>> b/package/libvncserver/libvncserver.mk
>> index 99d757b..b26d5b9 100644
>> --- a/package/libvncserver/libvncserver.mk
>> +++ b/package/libvncserver/libvncserver.mk
>> @@ -4,13 +4,14 @@
>>  #
>>  
>> ################################################################################
>> 
>> -LIBVNCSERVER_VERSION = 0.9.9
>> +LIBVNCSERVER_VERSION = 0.9.10
>>  LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
>> -LIBVNCSERVER_SITE = 
>> http://downloads.sourceforge.net/project/libvncserver/libvncserver/$(LIBVNCSERVER_VERSION)
>> +LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
>>  LIBVNCSERVER_LICENSE = GPLv2+
>>  LIBVNCSERVER_LICENSE_FILES = COPYING
>>  LIBVNCSERVER_INSTALL_STAGING = YES
>>  LIBVNCSERVER_CONFIG_SCRIPTS = libvncserver-config
>> +LIBVNCSERVER_AUTORECONF = YES
> 
> Why is this needed? Please explain in a comment.

The autoreconf you mean?

No idea why exactly, but upstream no longer includes a ready-made 
configure script with the new release.
Since it is mentioned in their changelog ("Cleaned out the autotools 
build system which now uses autoreconf") I assume it is intentional, 
instead of overlooked.


Yours sincerely,

Floris Bos
