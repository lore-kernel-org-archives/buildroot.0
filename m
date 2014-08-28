From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 28 Aug 2014 23:42:39 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/sispmctl: fix static linking
In-Reply-To: <CAPiYbRKyWdOrOge52eSiJTa0DSD3BwcBwyc3yrxryTY073P+Ng@mail.gmail.com>
References: <1409008353-20940-1-git-send-email-romain.naour@openwide.fr>
 <CAPiYbRKyWdOrOge52eSiJTa0DSD3BwcBwyc3yrxryTY073P+Ng@mail.gmail.com>
Message-ID: <53FFA24F.1010205@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Phil,

Le 26/08/2014 08:47, Phil Eichinger a ?crit :
> On 26 August 2014 01:12, Romain Naour <romain.naour@openwide.fr
> <mailto:romain.naour@openwide.fr>> wrote:
> 
>     The static linking doesn't works with libusb-compat when using libusb-config.
>     Also the CFLAGS initialization with libusb-config --cflags is comented out.
> 
>     Based on libftdi's patch, add the support for pkg-config to link sispmctl
>     correctly.
> 
>     This allow to add correct include directory to CFLAGS
>     (Add -I$(STAGING_DIR)/usr/include and -I$(STAGING_DIR)/usr/include/libusb-1.0)
>     Also add needed libraries during static linking (-lusb -lusb-1.0 and -pthread)
> 
>     Since configure.ac <http://configure.ac> is modified, the configure script
>     needs to be regenerated
>     with autoreconf.
> 
>     Fixes:
>     http://autobuild.buildroot.net/results/647/6473088e751d3ab3a5227e9d7876966934e66378/build-end.log
> 
>     Cc: Phil Eichinger <phil.eichinger at gmail.com <mailto:phil.eichinger@gmail.com>>
>     Signed-off-by: Romain Naour <romain.naour@openwide.fr
>     <mailto:romain.naour@openwide.fr>>
> 
> 
> Thank you!
> 
> Cheers, Phil

Your welcome :)

Feel free to test this patch reply with your Tested-by.

Best regards,
Romain
