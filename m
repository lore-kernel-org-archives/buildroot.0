From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Dec 2010 08:00:07 -0300
Subject: [Buildroot] [PATCH 07/13] toolchain: move sysroot to host dir
In-Reply-To: <20101216114929.0558f286@surf>
References: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>	<1292353569-30172-8-git-send-email-gustavo@zacarias.com.ar>
	<20101216114929.0558f286@surf>
Message-ID: <4D09F137.4030602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/16/2010 07:49 AM, Thomas Petazzoni wrote:

>>  include toolchain/Makefile.in
>>  include package/Makefile.in
>>  
>> +STAGING_DIR:=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sysroot
> 
> This change breaks the ccache support, because when
> --sysroot=$(STAGING_DIR) is used, STAGING_DIR expands to nothing,
> because the definition of STAGING_DIR has been moved *after* the
> inclusion of package/Makefile.in. Any reason why you moved the
> definition ?
> 
> Regards,
> 
> Thomas

Yes, REAL_GNU_TARGET_NAME is filled in package/Makefile.in and we need it.
Maybe we can move it to the toolchain directory where it even sounds
more appropiate?
Regards.
