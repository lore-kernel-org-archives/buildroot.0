From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 2 Aug 2013 11:02:52 +0200
Subject: [Buildroot] [PATCH 1 of 2 v2] infra: introduce
 suitable-extractor helper function
In-Reply-To: <20130802105633.0deb97c3@skate>
References: <patchbomb.1375390546@BEANTN0L019720>
 <b277803240198c7900d9.1375390547@BEANTN0L019720>
 <20130802102851.388356b2@skate>
 <CAAXf6LWFBKk2mebh8eVdhR1Epcauf5Lmk4CZLqgDV4Us+SX+GA@mail.gmail.com>
 <20130802105633.0deb97c3@skate>
Message-ID: <CAAXf6LWH7ZMa78aJR3oNTL63KOPURQkApWfbkAESzzR4sX9UzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Aug 2, 2013 at 10:56 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 2 Aug 2013 10:50:44 +0200, Thomas De Schampheleire wrote:
>
>> > Do you know why we need this $(firstword ...) call here? In all places
>> > in was using directly $(INFLATE$(...)), except in the package
>> > infrastructure where it was doing this firstword additional call.
>> >
>> > It was added by Peter in 2c6390a5d0c01420879e9f23bc89afb19976da4a.
>>
>> It wasn't clear to me when I sent the patch, but I figured it didn't hurt.
>> But now I think I know: the inflate targets originate from the
>> .config, and users can add extra arguments there. In fact, the default
>> for $(ZCAT) is:
>> BR2_ZCAT="gzip -d -c"
>>
>> To check the dependency, we only want to check for 'gzip', but to do
>> the actual inflate, we shouldn't use 'firstword'. So, the patch is
>> wrong, and I will fix it :)
>
> Ok, makes sense to me now. Indeed this makes the patch wrong :)
>
> Are you annoyed if I integrate this in -next ? I want to release -rc1
> today, and I think this kind of stuff is a little bit too sensitive to
> be merged now. From your quick feedback on those patches, I have the
> feeling that you wanted it in 2013.08, so I don't want to ruin your
> hope, but I believe it's a bit too late now. What do you think?
>

It's always nice if patches make it to the upcoming release and not
the one after that :)
But I understand that it's not critical and could have side-effects we
didn't think of, so no problem to put it in -next. I won't hate you
for it ;)

Best regards,
Thomas
