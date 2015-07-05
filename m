From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 5 Jul 2015 11:49:52 +0200
Subject: [Buildroot] [PATCH v7 7/7] package/vlc: add opencv support
In-Reply-To: <20150705093914.GG3647@free.fr>
References: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
 <1436036821-10073-8-git-send-email-s.martin49@gmail.com>
 <20150705093914.GG3647@free.fr>
Message-ID: <CAHXCMMLoJK8zEF-O_bNA9ZU8X0AVTdo4yzPq3br2AbF3aaWABA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Jul 5, 2015 at 11:39 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Samuel, all,
>
> On 2015-07-04 21:07 +0200, Samuel Martin spake thusly:
>> This change adds 2 patches (backported from upstream) to vlc fixing the
>> build against opencv2 APIs.
>> This allows to select the minimal set of opencv modules when opencv
>> support is enabled.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> This reviewd tag stands, still I have a question:
>
>> diff --git a/package/vlc/Config.in b/package/vlc/Config.in
>> index b030a56..471f4a7 100644
>> --- a/package/vlc/Config.in
>> +++ b/package/vlc/Config.in
>> @@ -11,6 +11,8 @@ config BR2_PACKAGE_VLC
>>       depends on BR2_TOOLCHAIN_HAS_THREADS
>>       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
>>       select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
>> +     select BR2_PACKAGE_OPENCV_LIB_IMGPROC if BR2_PACKAGE_OPENCV
>> +     select BR2_PACKAGE_OPENCV_LIB_OBJDETECT if BR2_PACKAGE_OPENCV
>
> objdetect already selects imgproc. So, does vlc w/ opencv really need
> imgproc by itself? If so, the select is OK, otherwise, it is
> superfluous.

I select all opencv's modules used in the vlc code-base [1].

[1] http://git.videolan.org/gitweb.cgi/vlc.git/?p=vlc.git;a=blob;f=modules/video_filter/opencv_example.cpp;h=998f286ba2269fdf1680b375c1f849d24598742d;hb=HEAD#l42


Regards,

-- 
Samuel
