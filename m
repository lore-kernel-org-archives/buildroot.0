From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 17:48:36 +0100
Subject: [Buildroot] [PATCH v2 3/4] package/avrdude: depends on libftdi1
 instead of libftdi
In-Reply-To: <CAHXCMM+52vee+K8p=KOonr=d+F4M7bk-5zWMG2Q2ghmGyWTKLA@mail.gmail.com>
References: <1425813964-5295-1-git-send-email-s.martin49@gmail.com>
 <1425813964-5295-4-git-send-email-s.martin49@gmail.com>
 <20150308114842.GB2518@tarshish>
 <CAHXCMMJ30MEE33mytg4xy9pZePD0Z+ezH8pJE6wzhaqJWdkyGg@mail.gmail.com>
 <20150316141523.2561f737@free-electrons.com>
 <CAHXCMM+52vee+K8p=KOonr=d+F4M7bk-5zWMG2Q2ghmGyWTKLA@mail.gmail.com>
Message-ID: <20150317174836.6384db5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Tue, 17 Mar 2015 17:24:07 +0100, Samuel Martin wrote:

> Well, my first thought was simply to drop the libftdi support because
> of the additional dependency it pulls (libusb-compat):
> - with dependency on libftdi:
>   arvdude -> libftdi -> libusb-compat -> libusb
> - with dependency on libftdi1:
>   arvdude -> libftdi1 -> libusb
> 
> Note that, the configure script uses libftdi1 (if found) in priority
> over libftdi.

Yes, but what happens if the user has BR2_PACKAGE_AVRDUDE=y and
BR2_PACKAGE_LIBFTDI=y ? Then with your patch, we have an "undefined
behavior": if libftdi happens to be built before avrdude, avrdude will
have libftdi support, otherwise not.

Unless of course you propose a patch that allows to explicitly
enable/disable libftdi support in avrdude. But otherwise, if avrdude
*can* use libftdi, then it should have an optional dependency on it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
