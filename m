From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 17 Feb 2020 13:27:15 +0100
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.4.3
In-Reply-To: <87pneeebk9.fsf@dell.be.48ers.dk>
References: <87pneeebk9.fsf@dell.be.48ers.dk>
Message-ID: <47D0F7F6-18D0-4BB9-AE36-3B880D384AA5@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> Il giorno 16 feb 2020, alle ore 17:34, Peter Korsgaard <peter@korsgaard.com> ha scritto:
> 
> ?
>> 
>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
> Hi,
> 
>>> +++ b/package/nfs-utils/nfs-utils.mk
>>> @@ -4,7 +4,7 @@
>>> #
>>> ################################################################################
> 
>>> -NFS_UTILS_VERSION = 1.3.4
>>> +NFS_UTILS_VERSION = 2.4.3
>>> NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
>>> NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
>>> NFS_UTILS_LICENSE = GPL-2.0+
>>> @@ -23,7 +23,8 @@ NFS_UTILS_CONF_OPTS = \
>>> --enable-ipv6 \
>>> --without-tcp-wrappers \
>>> --with-statedir=/run/nfs \
>>> -    --with-rpcgen=internal
>>> +    --with-rpcgen=$(HOST_DIR)/bin/rpcgen
> 
>> While host-nfs-utils does get implicitly pulled in by libtirpc, it
>> isn't very obvious - So I've added an explicit host-nfs-utils dependency
>> and committed, thanks.

Oh, yes it only accidentally worked without that dependency.

> 
> Ups, and I forgot to mention that I also dropped _AUTORECONF = YES now
> that all the patches are gone.

Ah right, I didn?t think that is superfluous now.

Thank you

Best regards
Giulio

> 
> -- 
> Bye, Peter Korsgaard
