From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Wed, 5 Nov 2008 02:37:17 +0100
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909C91B4A@mi8nycmail19.Mi8.com>
References: <20081104125039.199A23C8D7@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909C91B2A@mi8nycmail19.Mi8.com>
	<e4c675870811041536w7c035576ie7690ba0d3c83e8f@mail.gmail.com>
	<BD79186B4FD85F4B8E60E381CAEE1909C91B34@mi8nycmail19.Mi8.com>
	<e4c675870811041553o7b15d778m6fb4bb6052909314@mail.gmail.com>
	<BD79186B4FD85F4B8E60E381CAEE1909C91B38@mi8nycmail19.Mi8.com>
	<e4c675870811041653j7c8e3c50r9ab4f35958681a91@mail.gmail.com>
	<BD79186B4FD85F4B8E60E381CAEE1909C91B4A@mi8nycmail19.Mi8.com>
Message-ID: <e4c675870811041737h201fdd1ev4ccd6a7e8bb25228@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/11/5 hartleys <hartleys@visionengravers.com>:
> On Tuesday, November 04, 2008 5:53 PM, Roberto A. Foglietta wrote:
>>> That gets rid of the messages. FYI, HOST_GLIB_BIN and HOST_GLIB get
>>> set to the following on my system:
>>>
>>> HOST_GLIB_BIN=
>>> HOST_GLIB=.
>>>
>>> I just echoed the variables as:
>>>
>>>        @echo HOST_GLIB_BIN=$(HOST_GLIB_BIN)
>>>        @echo HOST_GLIB=$(HOST_GLIB)
>>>
>>> I assume HOST_GLIB_BIN is ok since I don't have glib-genmarshal
>>> installed. But will the '.' be a problem for HOST_GLIB?
>>>
>>
>> I did not found any Makefile nor .mk in which HOST_GLIB_BIN is used!!!
>>
>> You are right again because HOST_GLIB should be /usr by default, in
> fact:
>
> <snip>
>
>> so again,
>>
>> http://busybox.net/bugs/view.php?id=5984
>
> Still not messages (good). Now I get:
>
> HOST_GLIB_BIN=
> HOST_GLIB=/usr
>
> Which is also good (I guess, based on what you say above).
>
> Yes, it appears HOST_GLIB_BIN is just used to figure out what HOST_GLIB
> is supposed to be.
>
> Question: Does this really belong in the top level Makefile?
>

 I do not know for sure, original commit was not mine. I just
identified the problem and tried to solve it.


 At this time the only way to compile glib for the target would be
install libglib-dev on the host.

 However as Intravenoes (cfr. note: 0015074 of bug report 0005724)
noted host/target glib version mismatch could be fatal.

 AFAIK the whole glib package should go expanded  in

 toolchain_build_ARCH/glib-$GLIB_VERSION

 and compiled in

 toolchain_build_ARCH/glib-$GLIB_VERSION-host

 like others tools like sstrip or gcc


 Original bug report:

 http://busybox.net/bugs/view.php?id=5724


 Cheers,
-- 
/roberto
