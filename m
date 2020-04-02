From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Apr 2020 20:58:00 +0200
Subject: [Buildroot] [PATCH 2/3] linux: fix option string for kernel
 5.5.x
In-Reply-To: <20200330182250.1515995-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 30 Mar 2020 20:22:49 +0200")
References: <20200330182250.1515995-1-bernd.kuhls@t-online.de>
 <20200330182250.1515995-2-bernd.kuhls@t-online.de>
Message-ID: <877dyxaf5z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/linux-headers/Config.in.host                            | 2 +-
 >  .../toolchain-external-custom/Config.in.options                 | 2 +-

This change is not about linux?

 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
 > index 5c5a9b0330..b89605bbf7 100644
 > --- a/package/linux-headers/Config.in.host
 > +++ b/package/linux-headers/Config.in.host
 > @@ -132,7 +132,7 @@ choice
 >  	  in the choice, then select the latest version.
 
 >  config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_5
 > -	bool "5.5.x or later"
 > +	bool "5.5.x"

Why? We've used the .. or later text ever since:

commit 338e62bd5d23e843a4bf69c06a02681450e858ae
Author: Vincent Fazio <vfazio@xes-inc.com>
Date:   Wed Jan 15 19:29:07 2020 +0100

   toolchain: allow using custom headers newer than latest known ones

-- 
Bye, Peter Korsgaard
