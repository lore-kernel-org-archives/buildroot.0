From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 1 Jul 2016 23:37:53 +0200
Subject: [Buildroot] [PATCH v3] supertuxkart: new package
In-Reply-To: <325b82b7-7232-082d-30ce-88a433d51090@smile.fr>
References: <1465673942-840-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <325b82b7-7232-082d-30ce-88a433d51090@smile.fr>
Message-ID: <f281df94-3e70-a264-c4cb-098fe85dd579@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 01/07/2016 ? 23:18, Romain Naour a ?crit :
> Hi Ezequiel,
> 

[snip]

>> diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
>> new file mode 100644
>> index 000000000000..4ee8c4d57efe
>> --- /dev/null
>> +++ b/package/supertuxkart/Config.in
>> @@ -0,0 +1,34 @@
>> +config BR2_PACKAGE_SUPERTUXKART
>> +	bool "supertuxkart"
>> +	depends on BR2_USE_MMU # fork()
>> +	depends on BR2_INSTALL_LIBSTDCPP # openal
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
>> +	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
>> +	depends on BR2_PACKAGE_HAS_LIBGL
>> +	depends on BR2_PACKAGE_XORG7
>> +	depends on !BR2_TOOLCHAIN_USES_MUSL
>> +	select BR2_PACKAGE_JPEG
> 
> A package can't select a virtual package, see section "Notes on depending on a
> virtual package" in [2].
> 
> [2] http://nightly.buildroot.org/manual.html#_infrastructure_for_virtual_packages

Sorry, the virtual package jpeg can indeed be selected by SUPERTUXKART.

Best regards,
Romain

> 
> Other than that, this package looks ok.
> 
> Best regards,
> Romain Naour
