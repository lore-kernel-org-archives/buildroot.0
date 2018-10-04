From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 04 Oct 2018 19:56:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/asterisk: libsrtp needs openssl
References: <20181003190829.28477-1-bernd.kuhls@t-online.de>
 <20181004141856.3e7a32b6@windsurf>
Message-ID: <1s0i8fxbeu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 04 Oct 2018 14:18:56 +0200 schrieb Thomas Petazzoni:

>> -ifeq ($(BR2_PACKAGE_LIBSRTP),y)
>> +# asterisk needs an openssl-enabled libsrtp
>> +ifeq ($(BR2_PACKAGE_LIBSRTP)$(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yyx)
> 
> Any reason to exclude static linking configurations here? This is not
> explained in the commit log.

Hi Thomas,

openssl support in libsrtp depends on libdl:
https://git.buildroot.net/buildroot/tree/package/libsrtp/libsrtp.mk#n27

Shall I sent v2?

Regards, Bernd
