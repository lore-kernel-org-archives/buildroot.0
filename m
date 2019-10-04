From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 03 Oct 2019 23:26:31 -0300
Subject: [Buildroot] [PATCH 15/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: check the order of menu of menus
References: <e31668f6-4b46-3e08-4339-1715af0c5e7a@gmail.com>
Message-ID: <5d96add744563_5fe63f847016cf9018567@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

My free time comes and goes, sorry about my slow review.

On Wed, Sep 25, 2019 at 05:01 AM, Jerzy Grzegorek wrote:

>> On Tue, Sep 03, 2019 at 06:13 PM, Jerzy Grzegorek wrote:
>>
>> [snip]
>>> +++ b/utils/checkpackagelib/lib_config.py
>>> @@ -65,6 +65,10 @@ class CommentsMenusPackagesOrder(_CheckFunction):
>>>       comments_order_checking = [False]
>>>       print_comment_warning = [True]
>>>   
>>> +    first_menu = [True, True]
>>> +    menu = [""]
>>> +    print_menu_warning = [True]
>> This is not good. Please use instance variables initialized in before().
>> before() is called... well... *before* every file is processed :-)
>> This will ensure the correct initial state for each file being processed.
> 
> So, should I also use instance variables
> 
>  ??? menu_of_packages = [""]
>  ??? package = [""]
>  ??? print_package_warning = [True]
> 
> initialized in before()?

I think so.
If you will include this in this series or not, it's up to you.
Right now I don't know a good example to demonstrate a false warning generated
by those variables. But the code would be more future-proof if we change them.


Regards,
Ricardo
