From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Thu, 4 Apr 2019 10:53:15 +0700
Subject: [Buildroot] [PATCH v3] package/libcamera: Add libcamera package
In-Reply-To: <20190403225528.4d00a4c8@windsurf>
References: <20190403112902.29930-1-kieran.bingham@ideasonboard.com>
 <20190403225528.4d00a4c8@windsurf>
Message-ID: <103473a8-35a2-9bd3-f8ac-0274ea2b532a@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 03/04/2019 21:55, Thomas Petazzoni wrote:
> Hello Kieran,
> 
> On Wed,  3 Apr 2019 18:29:02 +0700
> Kieran Bingham <kieran.bingham@ideasonboard.com> wrote:
> 
>>   http://libcamera.org/
> 
> I've applied to master, with a few minor changes.

Thank you very much.

I'm perfectly happy for you to have made changes as required.

> First, our canonical commit title for new packages is:
> 
> 	package/foo: new package
> 
>> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
>> new file mode 100644
>> index 000000000000..cc5e84424c38
>> --- /dev/null
>> +++ b/package/libcamera/Config.in
>> @@ -0,0 +1,13 @@
>> +config BR2_PACKAGE_LIBCAMERA
>> +	bool "libcamera"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	# C++11 + https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54316
>> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>> +	depends on BR2_PACKAGE_HAS_UDEV
>> +	help
>> +	  libcamera provides a software stack to support
>> +	  complex devices that need heavy hardware image
>> +	  processing operations.
>> +
>> +		http://www.libcamera.org/
> 
> The indentation of the URL should have been one tab + two spaces.
> 
> More importantly (and that was the only thing really missing): the
> Config.in comment that describes the dependencies was missing.

Ahh, that's neat - so it shows up the comment when the dependencies
aren't met.

Thank you for adding it.


>> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
>> new file mode 100644
>> index 000000000000..7d5392dde2bb
>> --- /dev/null
>> +++ b/package/libcamera/libcamera.hash
>> @@ -0,0 +1,4 @@
>> +sha256 2c01dc76d98ef257660f8ef3f4f17f042e112b5eca6b364ad615220c96fbd066  libcamera-d5ca33f6c7b0cd1ca20ec5dc7131aeedf1503080.tar.gz
>> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/gnu-gpl-2.0.txt
>> +sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  licenses/gnu-lgpl-2.1.txt
>> +
> 
> Unneeded empty new line that was causing a check-package warning.

Doh :S at least that's an easy fix. :-)

> Thanks for this contribution! Great to see libcamera moving forward!

Thank you all for accepting it into Buildroot!

It has already proved very valuable to us, catching several build issues
when compiling against different toolchains.

> 
> Best regards,
> 
> Thomas
> 

-- 
Regards
--
Kieran
