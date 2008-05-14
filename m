From: John Voltz <john.voltz@gmail.com>
Date: Wed, 14 May 2008 13:17:52 -0400
Subject: [Buildroot] [BR-AVR32] builkding 2.2.0-rc1 for atstk1002
In-Reply-To: <482B1529.7030207@gmail.com>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417A24@wpr01.wprmedical.local>
	<482B1529.7030207@gmail.com>
Message-ID: <46a136670805141017g3d1a5a40y92d38e91231e30d7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure you don't have libiconv selected in menuconfig. It is part of
uClibc, and some packages will complain if it exists alongside uClibc's
implementation. Also, make sure that uClibc's headers were not replaced by
the headers from libiconv if you did in fact have it selected.

John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080514/c0d7f325/attachment.htm 
