From: =?UTF-8?Q?Bartosz_Bi=c5=82as?= <b.bilas@grinn-global.com>
Date: Mon, 19 Jul 2021 10:08:01 +0200
Subject: [Buildroot] [PATCH] package/cegui: disable Python SWIG
 extension modules when OpenGL renderer is disabled
In-Reply-To: <20210718222736.278b6c6f@windsurf>
References: <20210615194536.265246-1-b.bilas@grinn-global.com>
 <20210718222736.278b6c6f@windsurf>
Message-ID: <fb9e9d4f-7b2a-61ea-b18d-dacd742c6075@grinn-global.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Thomas,

On 7/18/21 10:27 PM, Thomas Petazzoni wrote:
> Hello Bartosz,
>
> On Tue, 15 Jun 2021 21:45:36 +0200
> Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>
>> Those modules need OpenGL renderer so disable them when it's missing.
>>
>> Fixes:
>>   - http://autobuild.buildroot.net/results/592/592fcffb226c8b44ada5fa3cdb8ab15c627f29dc/
>>   - http://autobuild.buildroot.net/results/9ad/9ad768b7e2a3c59833e03986c245f2f4b5d25dcd/
>>
>>    and more...
>>
>> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
>> ---
>>   package/cegui/cegui.mk | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
>> index 747ebbb953..c5ff45818e 100644
>> --- a/package/cegui/cegui.mk
>> +++ b/package/cegui/cegui.mk
>> @@ -38,7 +38,8 @@ CEGUI_CONF_OPTS += -DCEGUI_USE_EPOXY=ON -DCEGUI_USE_GLEW=OFF \
>>   else
>>   CEGUI_CONF_OPTS += -DCEGUI_USE_EPOXY=OFF -DCEGUI_USE_GLEW=OFF \
>>   	-DCEGUI_BUILD_RENDERER_OPENGL=OFF \
>> -	-DCEGUI_BUILD_RENDERER_OPENGL3=OFF
>> +	-DCEGUI_BUILD_RENDERER_OPENGL3=OFF \
>> +	-DCEGUI_BUILD_PYTHON_MODULES_SWIG=OFF
> Thanks for the patch, but shouldn't we set
> -DCEGUI_BUILD_PYTHON_MODULES_SWIG=OFF unconditionally? Indeed, there is
> nothing in cegui.mk that ensures that Python/SWIG is available prior to
> the cegui build, i.e there is nothing in place to optionally build this
> Python SWIG extension.
>
> So if nobody uses it, we should rather disable it unconditionally. Do
> you agree ?

Yup, let's do that. Should I send v2 or will you do that during committing?

Best
Bartek
>
> Thanks a lot,
>
> Thomas
-- 
