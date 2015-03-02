From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 2 Mar 2015 21:35:36 +0100
Subject: [Buildroot] [PATCH 2/8] package/libiio: update cmake code for
 libxml2 detection
In-Reply-To: <54C8003C.3000507@mind.be>
References: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
 <1422220435-18689-3-git-send-email-s.martin49@gmail.com>
 <54C8003C.3000507@mind.be>
Message-ID: <CAHXCMMKf-5eEmnRjxj8QepbekNdcV1BLa1TuiUu5sYHW8Tw7Zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

On Tue, Jan 27, 2015 at 10:16 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 25/01/15 22:13, Samuel Martin wrote:
>> Only check for libxml2 when it is needed.
>>
>> This prevents CMake from falling back on the libxml2-config.cmake
>> installed on the host system (i.e. when libxml2 >=2.9.2 is part of the
>> host system), but not enabled as a target package (i.e. not existing in
>> the staging tree).
>
>  This is worrisome... I would hope that our cmake could be convinced never to
> look in /usr/share/cmake when cross-compiling...

I finally found some time to check the cmake thing, and it turns out
that it is possible to control cmake to not searching outside of the
sysroot.
I'll cook a patch doing it and respin the series shortly, and reject this patch.

Regards,


-- 
Samuel
