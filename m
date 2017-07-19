From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 15:58:54 +0200
Subject: [Buildroot] [PATCH] xserver_xorg-server: add upstream security
	fixes for CVE-2017-10971 / 10972
In-Reply-To: <20170710070752.16623-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 10 Jul 2017 09:07:52 +0200")
References: <20170710070752.16623-1-peter@korsgaard.com>
Message-ID: <8760eoa5pd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Add upstream patches fixing the following security issues:
 > CVE-2017-10971:
 > 	The endianess handling for X Events assumed a fixed size of X Event structures and
 > 	had a specific 32 byte stack buffer for that.

 > 	However "GenericEvents" can have any size, so if the events were sent in the wrong
 > 	endianess, this stack buffer could be overflowed easily.

 > 	So authenticated X users could overflow the stack in the X Server and with the X
 > 	server usually running as root gaining root prileveges.

 > CVE-2017-10972:
 > 	An information leak out of the X server due to an uninitialized stack area when swapping
 > 	event endianess.

 > For more details, see the advisory:

 > http://www.openwall.com/lists/oss-security/2017/07/06/6

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
