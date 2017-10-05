From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 05 Oct 2017 20:31:31 +0000
Subject: [Buildroot] [Bug 10366] dropbear download url has changed
In-Reply-To: <bug-10366-163@https.bugs.busybox.net/>
References: <bug-10366-163@https.bugs.busybox.net/>
Message-ID: <bug-10366-163-0TmxdXXTcM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10366

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
In what way has it changed?

http still works here:

wget http://matt.ucc.asn.au/dropbear/releases/dropbear-2017.75.tar.bz2
--2017-10-05 22:26:51-- 
http://matt.ucc.asn.au/dropbear/releases/dropbear-2017.75.tar.bz2
Resolving matt.ucc.asn.au (matt.ucc.asn.au)... 130.95.13.18,
2405:3c00:5200:100::18
Connecting to matt.ucc.asn.au (matt.ucc.asn.au)|130.95.13.18|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1623392 (1.5M) [application/x-bzip2]
Saving to: ?dropbear-2017.75.tar.bz2?

(and so does https):

wget https://matt.ucc.asn.au/dropbear/releases/dropbear-2017.75.tar.bz2
--2017-10-05 22:27:26-- 
https://matt.ucc.asn.au/dropbear/releases/dropbear-2017.75.tar.bz2
Resolving matt.ucc.asn.au (matt.ucc.asn.au)... 130.95.13.18,
2405:3c00:5200:100::18
Connecting to matt.ucc.asn.au (matt.ucc.asn.au)|130.95.13.18|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1623392 (1.5M) [application/x-bzip2]
Saving to: ?dropbear-2017.75.tar.bz2.1?

The server does send a HSTS header to ask browsers to use https, but that isn't
really a problem with wget.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
