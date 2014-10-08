From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 08 Oct 2014 22:17:57 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/sispmctl: fix static linking
In-Reply-To: <20141005233651.6320c514@free-electrons.com>
References: <1409008353-20940-1-git-send-email-romain.naour@openwide.fr>
 <20141005233651.6320c514@free-electrons.com>
Message-ID: <54359BF5.80004@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 05/10/2014 23:36, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Tue, 26 Aug 2014 01:12:33 +0200, Romain Naour wrote:
>> The static linking doesn't works with libusb-compat when using libusb-config.
>> Also the CFLAGS initialization with libusb-config --cflags is comented out.
>>
>> Based on libftdi's patch, add the support for pkg-config to link sispmctl
>> correctly.
>>
>> This allow to add correct include directory to CFLAGS
>> (Add -I$(STAGING_DIR)/usr/include and -I$(STAGING_DIR)/usr/include/libusb-1.0)
>> Also add needed libraries during static linking (-lusb -lusb-1.0 and -pthread)
>>
>> Since configure.ac is modified, the configure script needs to be regenerated
>> with autoreconf.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/647/6473088e751d3ab3a5227e9d7876966934e66378/build-end.log
>>
>> Cc: Phil Eichinger <phil.eichinger@gmail.com>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 
> Thanks, applied. Please submit the patch upstream so that one day we
> can remove it from Buildroot.
> 

Patch submitted in the sispmctl forum:
https://sourceforge.net/p/sispmctl/discussion/539852/thread/35ad2797/

Best regards,
Romain
