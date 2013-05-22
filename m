From: Assaf Inbal <shmuelzon@gmail.com>
Date: Wed, 22 May 2013 09:55:14 +0300
Subject: [Buildroot] [PATCH 04/12] lbase64: New package
In-Reply-To: <519C636D.9010805@mind.be>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-4-git-send-email-shmuelzon@gmail.com>
 <20130520165204.0269d05a@skate>
 <CADwac6CnLFHP5=yDsnF5xfB4GOMSQsCi3=J2QVPukdy=kTS+QA@mail.gmail.com>
 <20130520192543.3b61d666@skate> <519C636D.9010805@mind.be>
Message-ID: <CADwac6DEuYjE2cnXVX9rqnQnckOdHSNz+h-CSYvTCQ9Y1U_A-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On 20/05/13 19:25, Thomas Petazzoni wrote:
>
>> >Also, regarding the static library, the output of the package is always a
>>> >shared object since it needs to be loaded dynamically by Lua scripts.
>>> The
>>> >default target of the package is a test so I need to specifically
>>> specify
>>> >the target.
>>>
>> Ok. Then maybe your package needs to depend on !BR2_PREFER_STATIC_LIB.
>> Or maybe more of the Lua stuff, if it requires shared libraries.
>>
>
>  We currently probably have many packages that generate .so files even if
> PREFER_STATIC_LIB is true - that's why it is "prefer", right?
>
>  That said, I'm certainly in favour of making the STATIC stuff more strict.


I think there is some misunderstanding regarding libraries in Lua. When Lua
libraries are created, they can either be Lua text files or C code that
uses Lua API so that the library's API can be called from Lua scripts. When
choosing the latter option, the output must be a shared object, when
calling the 'require' function in Lua to load an external file, Lua will
look for file names ending with either 'lua' or 'so'.
There is simply no way to 'statically link' a Lua library.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130522/76806d31/attachment.html>
