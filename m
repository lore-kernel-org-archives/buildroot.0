From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Oct 2012 22:30:53 +0200
Subject: [Buildroot] Selecting custom skeleton hides terminal settings
	Why ?
In-Reply-To: <63446FE4CD66446495AD2CCBD689DCB9@JohanW7> (Sagaert Johan's
 message of "Sun, 21 Oct 2012 21:36:49 +0200")
References: <63446FE4CD66446495AD2CCBD689DCB9@JohanW7>
Message-ID: <87y5izr2iq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> (2012.11 git)
 
 Sagaert> When i select a custom skeleton the settings for the login
 Sagaert> prompt (ttyxxx) and baudrate are hidden .

 Sagaert> Can someone explain why this was altered this way ?

Because it relies on a specific syntax in the default /etc/inittab, that
might not be present if you use a custom skeleton (perhaps you don't
even have an inittab).

-- 
Bye, Peter Korsgaard
