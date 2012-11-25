From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 25 Nov 2012 13:17:36 +0100
Subject: [Buildroot] [PATCH] List all the available hook points
In-Reply-To: <CAHXCMMK2UfLJ5LEuky7tkh8fGPa+4cpCTx54UdSod=nbvhwxWw@mail.gmail.com>
References: <1353273224-14685-1-git-send-email-zinosat@tiscali.it>
 <CAHXCMMK2UfLJ5LEuky7tkh8fGPa+4cpCTx54UdSod=nbvhwxWw@mail.gmail.com>
Message-ID: <CAHXCMMLuAFVYX4BzVk_kLOAxiz4DjZsAPLPYRZfvvHO7=4BxOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Davide, Yann, all,

2012/11/18 Samuel Martin <s.martin49@gmail.com>:
> Hi Davide, all,
>
> 2012/11/18 Davide Viti <zinosat@tiscali.it>:
>> The list was obtained with the following command:
>>   grep "_HOOKS[ ]\+?=" package/pkg-generic.mk
>> ---
>>  docs/manual/adding-packages-generic.txt |    4 ++++
>>  1 files changed, 4 insertions(+), 0 deletions(-)
>>
>> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
>> index b05043a..a2f37ec 100644
>> --- a/docs/manual/adding-packages-generic.txt
>> +++ b/docs/manual/adding-packages-generic.txt
>> @@ -357,6 +357,9 @@ userful for generic packages.
>>
>>  The following hook points are available:
>>
>> +* +LIBFOO_POST_DOWNLOAD_HOOKS+
>> +* +LIBFOO_POST_EXTRACT_HOOKS+
>> +* +LIBFOO_PRE_PATCH_HOOKS+
>>  * +LIBFOO_POST_PATCH_HOOKS+
>>  * +LIBFOO_PRE_CONFIGURE_HOOKS+
>>  * +LIBFOO_POST_CONFIGURE_HOOKS+
>> @@ -364,6 +367,7 @@ The following hook points are available:
>>  * +LIBFOO_POST_INSTALL_HOOKS+ (for host packages only)
>>  * +LIBFOO_POST_INSTALL_STAGING_HOOKS+ (for target packages only)
>>  * +LIBFOO_POST_INSTALL_TARGET_HOOKS+ (for target packages only)
>> +* +LIBFOO_POST_INSTALL_IMAGES_HOOKS+
>
> I'm a bit worried about this POST_INSTALL_IMAGES_HOOKS could be
> mis-understood or mis-used...
> Maybe it'd be worth to add few words saying that it's mainly for
> bootloader purpose.

Since the POST_INSTALL_IMAGES_HOOKS seems to be controversial, at
least its presence in the documentation, I think it is not worth to
document it.

My point is the documentation should contain as much information as
possible to safely hack Buildroot; so, avoid documenting things that
may be mis-understood or mis-used.

So Davide, could you repost the patch without the POST_INSTALL_IMAGES_HOOKS?


BTW, this hook is used in cases as special as rare (only used once in
the current Buildroot code base...).
Also, after some talk on the IRC chan, Thomas P. may have a way to not
use it where it is currently used.


Regards,

-- 
Samuel
