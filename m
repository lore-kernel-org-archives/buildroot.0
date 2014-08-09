From: Paul Cercueil <paul@crapouillou.net>
Date: Sat, 09 Aug 2014 15:42:16 +0200
Subject: [Buildroot] [PATCH] glm: Added package
In-Reply-To: <20140806221247.414d193e@free-electrons.com>
References: <1407279557-15416-1-git-send-email-paul@crapouillou.net>
 <20140806221247.414d193e@free-electrons.com>
Message-ID: <53E62538.5020408@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Baruch,

Thank you for your comments. I will send a new version of this patch 
shortly.

Paul

Le 06/08/2014 22:12, Thomas Petazzoni a ?crit :
> Dear Paul Cercueil,
>
> On Wed,  6 Aug 2014 00:59:17 +0200, Paul Cercueil wrote:
>
>> diff --git a/package/glm/Config.in b/package/glm/Config.in
>> new file mode 100644
>> index 0000000..2897cf0
>> --- /dev/null
>> +++ b/package/glm/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_GLM
>> +	bool "glm"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	help
>> +	  OpenGL Mathematics (GLM)
>> +
>> +	  http://glm.g-truc.net
>
> This lacks a comment explaining that this package depends on C++ when
> C++ is not available (see the Buildroot manual and many other packages
> in Buildroot).
>
>> diff --git a/package/glm/glm.mk b/package/glm/glm.mk
>> new file mode 100644
>> index 0000000..1e7e7df
>> --- /dev/null
>> +++ b/package/glm/glm.mk
>> @@ -0,0 +1,13 @@
>> +#############################################################
>> +#
>> +# glm
>> +#
>> +#############################################################
>
> Header length is not correct (80 # signs are needed), and there should
> be an empty line between the header and the first variable definition.
>
>> +GLM_VERSION = 0.9.5.4
>> +GLM_SITE = git://github.com/g-truc/glm.git
>
> github helper, as pointed by Baruch.
>
>> +GLM_LICENSE = MIT
>> +GLM_LICENSE_FILES = copying.txt
>> +GLM_INSTALL_STAGING = YES
>> +GLM_INSTALL_TARGET = NO
>
> Could you add a small comment above those two lines to explain why no
> target installation is needed?
>
> Thanks!
>
> Thomas
>
