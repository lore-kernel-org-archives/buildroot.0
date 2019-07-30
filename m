From: =?UTF-8?Q?Bartosz_Bi=c5=82as?= <b.bilas@grinn-global.com>
Date: Tue, 30 Jul 2019 18:06:18 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5webengine: fix build error
In-Reply-To: <20190730160359.3f298606@windsurf>
References: <20190730115832.21008-1-b.bilas@grinn-global.com>
 <20190730160359.3f298606@windsurf>
Message-ID: <2ca6ec7e-ff3c-8ca6-53b3-d1cb5318ac15@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I haven't found anything except this one: 
https://patchwork.ozlabs.org/comment/2079425/ . I've been struggling 
with it during developing one of my projects. According to the GCC 
version, I've encountered another error while I was building this 
package when gcc version was lower than 8. I'll do a clean build one 
more time with gcc 4.8 to show exactly what the problem is.

Best
Bartek
On 30.07.2019 16:03, Thomas Petazzoni wrote:
> Hello Bartosz,
>
> Thanks for your patch, see below for some questions.
>
> On Tue, 30 Jul 2019 13:58:32 +0200
> Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>
>> This commit adds a patch from upstream chromium
>> and bumps required minimal gcc version to 8.
>>
>> Fixes:
>>    ../../3rdparty/chromium/third_party/skia/third_party/skcms/skcms.cc:1909:16:
>>    note: in definition of macro 'NS'
>>    #define NS(id) id
>>                  ^~
>>
>> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> Do we have any corresponding build failure in the autobuilders ? If so,
> we like to have a reference to such build failures.
>
> Also, why is the required gcc version now >= 8.x ? This is not really
> explained in your commit log.
>
> Thomas
