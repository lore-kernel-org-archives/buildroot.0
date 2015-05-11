From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 11 May 2015 22:36:43 +0200
Subject: [Buildroot] [PATCH] package/tinyxml2: Use BUILD_SHARED_LIBS
 cmake standard
In-Reply-To: <20150511113002.12e1cc72@free-electrons.com>
References: <1431081780-21595-1-git-send-email-romain.naour@openwide.fr>	<CAHXCMMJXDf62TLk+pmwb+bzDq99FUs=TuagFFZS9=yedawuM0g@mail.gmail.com>	<554D1AB6.5020401@openwide.fr>
 <20150511113002.12e1cc72@free-electrons.com>
Message-ID: <555112DB.8010507@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Samuel, all

Le 11/05/2015 11:30, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Fri, 08 May 2015 22:21:10 +0200, Romain Naour wrote:
> 
>>>> + ################################
>>>> +@@ -46,12 +46,8 @@ endif(MSVC)
>>>> +
>>>> + ################################
>>>> + # Add targets
>>>> +-set(BUILD_STATIC_LIBS ON CACHE BOOL "Set to ON to build static libraries")
>>>> +-if(BUILD_STATIC_LIBS)
>>>> +-      add_library(tinyxml2static STATIC tinyxml2.cpp tinyxml2.h)
>>>> +-      set_target_properties(tinyxml2static PROPERTIES OUTPUT_NAME tinyxml2)
>>>> +-endif(BUILD_STATIC_LIBS)
>>>> +-add_library(tinyxml2 SHARED tinyxml2.cpp tinyxml2.h)
>>>> ++option(BUILD_SHARED_LIBS "build shared or static libraries" ON)
>>> Not needed, this is a global CMake flag.
>>
>> I have just cherry-picked the patch and keep things as is.
>> I can rework the patch an keep only useful part if you prefer ;-)
> 
> No, if it is an upstream patch, please keep it as unmodified as
> possible when backporting it to Buildroot.

Ok, so this series is still valid.
Thanks Samuel for the review :)

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
