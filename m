From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Aug 2014 09:39:42 -0300
Subject: [Buildroot] [PATCH 2/4] package/ncurses: fixup wide support for
 static targets
In-Reply-To: <CAAXf6LXekzfe45PXJx8z=UB0wB6g=NnuvK5LCgPuhnP0KDKvBg@mail.gmail.com>
References: <1408474091-25947-1-git-send-email-gustavo@zacarias.com.ar>
 <1408474091-25947-3-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LXsfoHafOY9cdVfP1waNcaWkrM8xMgyiqswE4LHX56wMA@mail.gmail.com>
 <20140820142238.404d0c48@free-electrons.com>
 <CAAXf6LXekzfe45PXJx8z=UB0wB6g=NnuvK5LCgPuhnP0KDKvBg@mail.gmail.com>
Message-ID: <53F4970E.4070706@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/20/2014 09:34 AM, Thomas De Schampheleire wrote:
>> Except that for now, the semantic is:
>>
>>  * BR2_PREFER_STATIC_LIB=y -> install only static libraries
>>
>>  * BR2_PREFER_STATIC_LIB undefined -> install *both* static and shared
>>    libraries.
> 
> Unless I'm missing something that is not what Gustavo's patch does. He
> explicitly added an else clause. So if STATIC_LIB is not defined, only
> links for the .so file will be created.

Hi, true, i'll respin a new fix to get both done when !static.
The spirit was to fix the static case omission, even though it works for
dynamic it departs from what it should do.
Regards.
