From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 11 Jun 2017 23:09:20 +0200
Subject: [Buildroot] [PATCH 02/14] package/irrlicht: new package
In-Reply-To: <1108a7ef-12c0-8e55-1a6f-22f9b4bae251@t-online.de>
References: <20170411222643.9770-1-romain.naour@gmail.com>
 <1108a7ef-12c0-8e55-1a6f-22f9b4bae251@t-online.de>
Message-ID: <007c55a8-b229-7d5d-1a73-c81057d53ca7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Thank for the review, it's very appreciated :)

Le 11/06/2017 ? 18:54, Bernd Kuhls a ?crit :
> Hi Romain,
> 
> afaics the irrlicht package only provides libirrlicht.so.
> What about naming the package libirrlicht and move it to
> "Target packages > Libraries > Graphics"?

Make sense even if irrlicht is the upstream name.
In the past, I hesitated to do so for efl package which can be named libefl.

> 
> Am Wed, 12 Apr 2017 00:26:31 +0200 schrieb Romain Naour:
> 
>> Signed-off-by: Romain Naour <romain.naour-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  DEVELOPERS                                         |  1 +
>>  package/Config.in                                  |  1 +
>>  ...-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch | 44 +++++++++++++++++
>>  package/irrlicht/0002-remove-sys-sysctl.h.patch    | 38 +++++++++++++++
> 
> Did you send the patches upstream?

Not yet. I'll do it.

> 
> @Whoever will commit the patches to buildroot: The irrlicht source code
> has DOS line endings, please adjust the patch files accordingly.

Indeed, thanks for the warning.

> 
>> diff --git a/package/irrlicht/irrlicht.mk b/package/irrlicht/irrlicht.mk
>> new file mode 100644
>> index 0000000..ab6187c
>> --- /dev/null
>> +++ b/package/irrlicht/irrlicht.mk
>> @@ -0,0 +1,57 @@
>> +################################################################################
>> +#
>> +# irrlicht
>> +#
>> +################################################################################
>> +
>> +IRRLICHT_VERSION_MAJOR = 1.8
>> +IRRLICHT_VERSION = $(IRRLICHT_VERSION_MAJOR).4
>> +IRRLICHT_SOURCE = irrlicht-$(IRRLICHT_VERSION).zip
>> +IRRLICHT_SITE = https://downloads.sourceforge.net/project/irrlicht/Irrlicht%20SDK/$(IRRLICHT_VERSION_MAJOR)/$(IRRLICHT_VERSION)
>> +IRRLICHT_INSTALL_STAGING = YES
>> +
>> +# Bundled libraries: bzip2, libaesGladman, libpng, lzma, zlib,
>> +IRRLICHT_LICENSE = bzip2 license, jpeg-license (BSD-3-Clause-like), Libpng, Zlib
> 
> Please mention the license of the irrlicht package itself.

Irrlicht itself use Zlib license.

http://pkgs.fedoraproject.org/cgit/rpms/irrlicht.git/tree/irrlicht.spec#n9

Best regards,
Romain

> 
> Regards, Bernd
> 
