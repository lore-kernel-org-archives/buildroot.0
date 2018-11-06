From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 05 Nov 2018 23:57:15 -0200
Subject: [Buildroot] [PATCH v2 00/12] default runtime test case for
 python packages v2
References: <20181105091555.484cb898@windsurf>
Message-ID: <5be0f4fb15b71_1ffa2af2b3fab998208b9@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, Nov 05, 2018 at 06:15 AM, Thomas Petazzoni wrote:

> On Sun, 04 Nov 2018 20:42:29 -0200, Ricardo Martincoski wrote:
[snip]
>> But now I prefer to resend using [4] (reworking each patch, of course) because:
>>  - it does not use multi inheritance that can potentially lead to future
>>    problems as the article you found pointed. Let's avoid it while we can;
>>  - the code for each test case for a python package looks nice, i.e. [2];
>> But it is not a strong preference.
>> 
>> What do you think about this?
> 
> First of all, thanks a lot for this additional research. self.__test__
> = False is definitely what we need here.
> 
> I also like the proposal that doesn't use multiple inheritance.
> 
> Let me make two possible additional proposals:
> 
>  - Use an integer for the Python version variable, rather than a
>    string, there is really no need for this to be a string I believe ?

You are correct. There is no need for a string. I will use an integer.

> 
>  - Alternatively, you could derive the version of the Python
>    interpreter to use from the child class name. Maybe this is too
>    "implicit" and a bit tricky, but I wanted to mention this
>    possibility. I.e, in the base class, you use
>    self.__class__.__name__, and it gives you the actual name of the
>    class that is instantiated. You can then check if the string
>    contains Python2 or Python3, and decide which interpreter to use
>    according to this. I am not saying I absolutely want this, I'm just
>    offering this as an alternative solution.

For comparison only, I created a patch on top of the wip v3:
https://gitlab.com/RicardoMartincoski/buildroot/commit/c824c5dfe9c1b0953088c9a818575287fe984fc4

I guess/hope that using the explicit python_version is easier to understand for
a newcomer.
Maybe a matter of taste.

I will send v3 using the explicit attribute.


Regards,
Ricardo
