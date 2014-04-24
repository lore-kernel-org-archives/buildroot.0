From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Apr 2014 11:03:32 +0200
Subject: [Buildroot] [PATCH v3] package/zile: add Zile is Lossy Emacs
	editor
In-Reply-To: <87k3afqfyg.fsf@linaro.org>
References: <1397737179-12262-1-git-send-email-alex.bennee@linaro.org>
 <1397737179-12262-2-git-send-email-alex.bennee@linaro.org>
 <20140417221418.5e3939fb@skate> <87k3afqfyg.fsf@linaro.org>
Message-ID: <CAAXf6LU_bVafpYfdZ-4+i+Tosxyj0FnJdn2CsUbCeSQDj9GKTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex,

On Thu, Apr 24, 2014 at 10:39 AM, Alex Benn?e <alex.bennee@linaro.org> wrote:
>
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
>> Dear Alex Benn?e,
> <snip>
>>> +++ b/package/zile/Config.in
>>> @@ -0,0 +1,13 @@
>>> +config BR2_PACKAGE_ZILE
>>> +    bool "zile"
>>> +    select BR2_PACKAGE_LIBGC
>>> +    depends on BR2_USE_MMU # fork()
>>
>> You need to replicate the dependencies of BR2_PACKAGE_LIBGC here.
>
> Surely the whole point of dependencies is the LIBGC ones get pulled in
> when you select LIBGC, or do you mean I need:
>
>      select BR2_PACKAGE_LIBGC
>      depends on BR2_PACKAGE_LIBGC
>      depends on BR2_USE_MMU # fork()


You need to replicate the 'depends on' statements of libgc in the
config option for zile, because the select would select libgc even
though its dependencies may not be met. This is more or less explained
here:
http://buildroot.uclibc.org/downloads/manual/manual.html#_literal_config_in_literal_file

Best regards,
Thomas
