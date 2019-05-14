From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 May 2019 12:04:36 +0000
Subject: [Buildroot] [Bug 11831] python-pyparsing: "No module named
 'pyparsing'" on target / while building cantools
In-Reply-To: <bug-11831-163@https.bugs.busybox.net/>
References: <bug-11831-163@https.bugs.busybox.net/>
Message-ID: <bug-11831-163-NNyemajdNK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11831

--- Comment #9 from Tibor Stolz <tistolz@outlook.de> ---
Created attachment 8051
  --> https://bugs.busybox.net/attachment.cgi?id=8051&action=edit
FIXED python-cantools/Config.in

For anyone interested in building python-cantools v18.0.1 (16 Feb 2018), here
is the Config.in file.

You also need packages python-bitstruct and python-pyparsing, which contain the
following line at the end of the .mk file:
    $(eval $(host-python-package))
Besides that, the python-bitstruct package is easy to get with utils/scanpypi,
and the python-pyparsing package is already available (with host-python-package
missing).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
