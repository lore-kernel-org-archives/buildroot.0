From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Wed, 07 Oct 2015 07:55:52 +0300
Subject: [Buildroot] [PATCH 1/1] qt: fix build for arm with
	BR2_STATIC_LIBS
In-Reply-To: <56144247.7050604@mind.be>
References: <1444128975-17943-1-git-send-email-alexander.lukichev@gmail.com>
 <56144247.7050604@mind.be>
Message-ID: <5614A5D8.40804@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Arnout!

  Thanks for taking a look!

On 10/07/2015 12:51 AM, Arnout Vandecappelle wrote:
>> --- /dev/null
>> +++ b/package/qt/0009-no-dynamic-library-plugins.patch
>> @@ -0,0 +1,27 @@
>> +Do not define QT_NO_DYNAMIC_LIBRARY if it is already defined
[...]
>> ++#ifndef QT_NO_DYNAMIC_LIBRARY
>> + #if (defined(Q_OS_VXWORKS) && !defined(VXWORKS_RTP)) || defined (Q_OS_NACL)
>> + #define QT_NO_DYNAMIC_LIBRARY
>> + #endif
>> ++#endif

>  I'm sorry, but I fail to understand how there can be a compilation error...
> We're not building for VxWorks or NaCl, so why should there be a problem?

Indeed. I will remove unnecessary Qt patch and send a new version. Thanks again!

--
Best regards,
  Alexander Lukichev
