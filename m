From: hartleys <hartleys@visionengravers.com>
Date: Tue, 4 Nov 2008 19:00:47 -0500
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <e4c675870811041553o7b15d778m6fb4bb6052909314@mail.gmail.com>
References: <20081104125039.199A23C8D7@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909C91B2A@mi8nycmail19.Mi8.com>
	<e4c675870811041536w7c035576ie7690ba0d3c83e8f@mail.gmail.com>
	<BD79186B4FD85F4B8E60E381CAEE1909C91B34@mi8nycmail19.Mi8.com>
	<e4c675870811041553o7b15d778m6fb4bb6052909314@mail.gmail.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C91B38@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, November 04, 2008 4:54 PM, Roberto A. Foglietta wrote:
>>>> FYI, with the patch for revision 23923 I get the following messages

>>>> when doing a "make menuconfig"
>>>>
>>>> Usage: grep [OPTION]... PATTERN [FILE]...
>>>> Try `grep --help' for more information.
>>>> dirname: missing operand
>>>> Try `dirname --help' for more information.
>>>> dirname: missing operand
>>>> Try `dirname --help' for more information.
>>>>
>>>> It's something in the change to HOST_GLIB_BIN:= but I can't figure 
>>>> it
>>
>>>> out...
>>>
>>> Because in 'make menuconfig' BR2_STAGING_DIR="" and some commands 
>>> fail, try this patch:
>>>
>>> http://busybox.net/bugs/view.php?id=5984
>>
>> Just found that patch and tried it. Better but still no go...
>>
>> The new messages are:
>>
>> Usage: grep [OPTION]... PATTERN [FILE]...
>> Try `grep --help' for more information.
>>
>> Could this be because I don't have a glib-genmarshal anywhere on my 
>> system? Actually, I'm not even sure what that executable is...
>
>
> Sorry, you are right. Please try again
>
> http://busybox.net/bugs/view.php?id=5984
> 
> patch -R < Makefile.patch
>
> patch < Makefile.patch2
>
> or
>
> svn revert Makefile
> patch < Makefile.patch2

That gets rid of the messages. FYI, HOST_GLIB_BIN and HOST_GLIB get set
to the following on my system:

HOST_GLIB_BIN=
HOST_GLIB=.

I just echoed the variables as:

	@echo HOST_GLIB_BIN=$(HOST_GLIB_BIN)
	@echo HOST_GLIB=$(HOST_GLIB)

I assume HOST_GLIB_BIN is ok since I don't have glib-genmarshal
installed. But will the '.' be a problem for HOST_GLIB?

Thanks,
Hartley
