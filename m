From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Mon, 20 Oct 2014 10:57:25 -0400
Subject: [Buildroot] [PATCH v2] yaml-cpp: new package
In-Reply-To: <20141019151116.GV4072@free.fr>
References: <1413470910-8412-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <20141019151116.GV4072@free.fr>
Message-ID: <544522D5.3080509@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Thanks for your review.

On 10/19/2014 11:11 AM, Yann E. MORIN wrote:
> Sebastien, All,
>
> On 2014-10-16 10:48 -0400, Sebastien Bourdelin spake thusly:
>> yaml-cpp is a YAML parser and emitter in C++ matching
>> the YAML 1.2 spec.
>>
>> https://code.google.com/p/yaml-cpp/
>>
>> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> [--SNIP--]
>> diff --git a/package/yaml-cpp/Config.in b/package/yaml-cpp/Config.in
>> new file mode 100644
>> index 0000000..fcfd60f
>> --- /dev/null
>> +++ b/package/yaml-cpp/Config.in
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_YAML_CPP
>> +	bool "yaml-cpp"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_LARGEFILE
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	select BR2_PACKAGE_BOOST
> Are BR2_LARGEFILE and BR2_TOOLCHAIN_HAS_THREADS hard dependencies of
> yaml-cpp, or are they inherited from boost?

Yes dependencies are inherited from boost.
I will send an other patch.

> In the latter case, it should be documented, like so:
>
>     depends on BR2_LARGEFILE # boost
>     depends on BR2_TOOLCHAIN_HAS_THREADS # boost
>
>> +	help
>> +	  yaml-cpp is a YAML parser and emitter in C++ matching
>> +	  the YAML 1.2 spec.
>> +
>> +	  https://code.google.com/p/yaml-cpp/
>> +
>> +comment "yaml-cpp needs a toolchain w/ C++, largefile, threads"
>> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
>> diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
>> new file mode 100644
>> index 0000000..391e317
>> --- /dev/null
>> +++ b/package/yaml-cpp/yaml-cpp.hash
>> @@ -0,0 +1,5 @@
>> +# hash from: https://yaml-cpp.googlecode.com/files/yaml-cpp-0.5.1.tar.gz:
>> +sha1 9c5414b4090491e96d1b808fe8628b31e625fdaa  yaml-cpp-0.5.1.tar.gz
>> +
>> +# Locally calculated:
>> +sha256 3e7c9052b43d987d41819a203d97fc45de4eed3ec67e0fdb14265c3d11046f06  yaml-cpp-0.5.1.tar.gz
>> diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
> Both hash locally and manually verified.
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.
>
>> new file mode 100644
>> index 0000000..5ebdb23
>> --- /dev/null
>> +++ b/package/yaml-cpp/yaml-cpp.mk
>> @@ -0,0 +1,13 @@
>> +################################################################################
>> +#
>> +# yaml-cpp
>> +#
>> +################################################################################
>> +
>> +YAML_CPP_VERSION = 0.5.1
>> +YAML_CPP_SITE = https://yaml-cpp.googlecode.com/files
>> +YAML_CPP_INSTALL_STAGING = YES
>> +YAML_CPP_LICENSE = MIT
>> +YAML_CPP_LICENSE_FILES = license.txt
>> +
>> +$(eval $(cmake-package))
>> -- 
>> 1.8.3.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Sebastien Bourdelin.
