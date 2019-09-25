From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Wed, 25 Sep 2019 10:01:49 +0200
Subject: [Buildroot] [PATCH 15/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: check the order of menu of menus
In-Reply-To: <5d8acec9deaba_9193fde200ab14c45114@ultri5.mail>
References: <20190903211341.10341-15-jerzy.m.grzegorek@gmail.com>
 <5d8acec9deaba_9193fde200ab14c45114@ultri5.mail>
Message-ID: <e31668f6-4b46-3e08-4339-1715af0c5e7a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ricardo,

> Hello,
>
> On Tue, Sep 03, 2019 at 06:13 PM, Jerzy Grzegorek wrote:
>
> [snip]
>> +++ b/utils/checkpackagelib/lib_config.py
>> @@ -65,6 +65,10 @@ class CommentsMenusPackagesOrder(_CheckFunction):
>>       comments_order_checking = [False]
>>       print_comment_warning = [True]
>>   
>> +    first_menu = [True, True]
>> +    menu = [""]
>> +    print_menu_warning = [True]
> This is not good. Please use instance variables initialized in before().
> before() is called... well... *before* every file is processed :-)
> This will ensure the correct initial state for each file being processed.

So, should I also use instance variables

 ??? menu_of_packages = [""]
 ??? package = [""]
 ??? print_package_warning = [True]

initialized in before()?

Regards,
Jerzy


> Here an example of result to avoid:
> With the whole series applied.
> $ utils/check-package package/Config.in >/dev/null
> 2285 lines processed
> 2 warnings generated
> $ utils/check-package package/Config.in.host >/dev/null
> 78 lines processed
> 0 warnings generated
> $ utils/check-package package/Config.in package/Config.in.host >/dev/null
> 2363 lines processed
> 3 warnings generated
>
> So we get a false warning for package/Config.in.host depending in other file(s)
> being processed before it or not.
> If you initialize all variables in before(), this error does not occur.
>
>
> Regards,
> Ricardo
