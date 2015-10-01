From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 01 Oct 2015 22:49:54 +0200
Subject: [Buildroot] [PATCH 1/3] package/kodi-pvr-argustv: add jsoncpp
 reverse dependency
References: <1443730342-12383-1-git-send-email-bernd.kuhls@t-online.de>
 <20151001202935.GA13467@tarshish>
Message-ID: <isi0ecxpcc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 01 Oct 2015 23:29:35 +0300 schrieb Baruch Siach:

>>  config BR2_PACKAGE_KODI_PVR_ARGUSTV
>>  	bool "kodi-pvr-argustv"
>> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
> 
> Why is that needed? Same for other patches in this series.

Hi Baruch,

the three pvr packages depend on jsoncpp, this is reflected in the .mk 
files and also in Config.in with the exception of kodi-pvr-argustv, where 
that select-line was missing, so I sent v2:
http://patchwork.ozlabs.org/patch/525299/

All packages lacked the rev dependency to gcc-4.7.

Regards, Bernd
