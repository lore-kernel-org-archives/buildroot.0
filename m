From: Lionel Orry <lionel.orry@gmail.com>
Date: Mon, 13 Oct 2014 07:51:20 +0200
Subject: [Buildroot] [PATCH] mongrel2: Use github call
In-Reply-To: <CAGduivwyhyq7UhACXhP_8B1YF+HrkEXEdZbiFYJZu1WnrYAvRw@mail.gmail.com>
References: <1413131250-5929-1-git-send-email-maxime.hadjinlian@gmail.com>
 <CAHXCMMLUUD98yZ+7_XS4+nYCKh-LUUw4a3nr3K5CSrKsgWibRw@mail.gmail.com>
 <CAGduivwyhyq7UhACXhP_8B1YF+HrkEXEdZbiFYJZu1WnrYAvRw@mail.gmail.com>
Message-ID: <CAKAx1ch49p6CHSZcEbN_gpvtxOpfQXCxmtS_-jFYSanabg80Kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sun, Oct 12, 2014 at 7:25 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> On Sun, Oct 12, 2014 at 6:53 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>> Hi Maxime,
>>
>> On Sun, Oct 12, 2014 at 6:27 PM, Maxime Hadjinlian
>> <maxime.hadjinlian@gmail.com> wrote:
>>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>>> ---
>>>  package/mongrel2/mongrel2.mk | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
>>> index 14e3a80..74383c4 100644
>>> --- a/package/mongrel2/mongrel2.mk
>>> +++ b/package/mongrel2/mongrel2.mk
>>> @@ -5,7 +5,7 @@
>>>  ################################################################################
>>>
>>>  MONGREL2_VERSION = v1.9.1
>>> -MONGREL2_SITE = https://github.com/zedshaw/mongrel2/releases/download/$(MONGREL2_VERSION)
>>> +MONGREL2_SITE = $(call github,zedshaw,mongrel2,$(MONGREL2_VERSION))
>>
>> I'm dubious about this change. What are your motivations for this change?
>> Mongrel2 has an explicit release/download location.
>> IMHO, github won't change because this page aims to be the place where
>> release tarball can be found, unlike git-archive tarball based on a
>> tag or a sha1.
> You are right. The releases is an uploaded file so we must use the URL.
> I'll drop this patch and push a new one to simply add a comment
> stating that it should not be changed.

indeed, I made the change to this URL on purpose. The automatic
download url from github does not contain everything, but the release
tarball does !

Regards,
Lionel

>>
>>>  MONGREL2_LICENSE = BSD-3c
>>>  MONGREL2_LICENSE_FILES = LICENSE
>>>  MONGREL2_DEPENDENCIES = sqlite zeromq
>>> --
>>> 2.1.1
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>> Regards,
>>
>> --
>> Samuel
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
