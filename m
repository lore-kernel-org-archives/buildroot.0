From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 25 Apr 2013 20:30:19 +0100
Subject: [Buildroot] [PATCH 1/2] wvstreams: new package
In-Reply-To: <20130425155024.7142922d@skate>
References: <1366881542-15350-1-git-send-email-spdawson@gmail.com>
 <1366881542-15350-2-git-send-email-spdawson@gmail.com>
 <20130425155024.7142922d@skate>
Message-ID: <CAHt8ZCO3J_=xgj5FX-s8Dc4rXcxuO2tEVzvBCDTyUiTcqmrPZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas; thanks for taking the time to look at this.

On 25 April 2013 14:50, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> +WVSTREAMS_DEPENDENCIES = openssl zlib
>
> openssl/zlib dependencies are mandatory here...
>
>> +WVSTREAMS_INSTALL_STAGING = YES
>> +
>> +WVSTREAMS_LICENSE = LGPLv2+
>> +WVSTREAMS_LICENSE_FILES = LICENSE
>> +
>> +# N.B. parallel make fails
>> +WVSTREAMS_MAKE = $(MAKE1)
>> +
>> +# Needed to work around problem with wvassert.h
>> +WVSTREAMS_CONF_OPT += CPPFLAGS=-DNDEBUG
>> +
>> +WVSTREAMS_CONF_OPT += --with-openssl --with-zlib --without-pam
>
> but this seems to suggest that openssl/zlib support is not mandatory.
> Can we make this optional if it's possible?

Unfortunately, the configure script errors out unless both openssl and
zlib are present --- they are really unconditional dependencies of
wvstreams. So the configure switches to enable/disable these features
are somewhat redundant.

Simon.
