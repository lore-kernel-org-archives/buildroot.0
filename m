From: hartleys <hartleys@visionengravers.com>
Date: Tue, 4 Nov 2008 20:01:22 -0500
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <e4c675870811041653j7c8e3c50r9ab4f35958681a91@mail.gmail.com>
References: <20081104125039.199A23C8D7@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909C91B2A@mi8nycmail19.Mi8.com>
	<e4c675870811041536w7c035576ie7690ba0d3c83e8f@mail.gmail.com>
	<BD79186B4FD85F4B8E60E381CAEE1909C91B34@mi8nycmail19.Mi8.com>
	<e4c675870811041553o7b15d778m6fb4bb6052909314@mail.gmail.com>
	<BD79186B4FD85F4B8E60E381CAEE1909C91B38@mi8nycmail19.Mi8.com>
	<e4c675870811041653j7c8e3c50r9ab4f35958681a91@mail.gmail.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C91B4A@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, November 04, 2008 5:53 PM, Roberto A. Foglietta wrote:
>> That gets rid of the messages. FYI, HOST_GLIB_BIN and HOST_GLIB get 
>> set to the following on my system:
>>
>> HOST_GLIB_BIN=
>> HOST_GLIB=.
>>
>> I just echoed the variables as:
>>
>>        @echo HOST_GLIB_BIN=$(HOST_GLIB_BIN)
>>        @echo HOST_GLIB=$(HOST_GLIB)
>>
>> I assume HOST_GLIB_BIN is ok since I don't have glib-genmarshal 
>> installed. But will the '.' be a problem for HOST_GLIB?
>>
>
> I did not found any Makefile nor .mk in which HOST_GLIB_BIN is used!!!
>
> You are right again because HOST_GLIB should be /usr by default, in
fact:

<snip>

> so again,
>
> http://busybox.net/bugs/view.php?id=5984

Still not messages (good). Now I get:

HOST_GLIB_BIN=
HOST_GLIB=/usr

Which is also good (I guess, based on what you say above).

Yes, it appears HOST_GLIB_BIN is just used to figure out what HOST_GLIB
is supposed to be.

Question: Does this really belong in the top level Makefile?

Hartley
