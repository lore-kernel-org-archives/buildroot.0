From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jun 2013 13:56:05 +0200
Subject: [Buildroot] [PATCH] system/permissions: make /root group+others
	non-writable
In-Reply-To: <1371939752-29205-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 23 Jun 2013 00:22:32 +0200")
References: <1371939752-29205-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87k3ljiuy2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Upon logging, dropbear whines if /root is group- or others-writable, and
 Yann> key-based authentication is attempted, reverting to password-based
 Yann> authentication:
 Yann>     dropbear[149]: /root must be owned by user or root, and not writable by others
 Yann>     dropbear[149]: Password auth succeeded for 'root' from 192.168.127.35:41566

 Yann> On my system, /root was 770. Changing to 700 fixed the issue.

 Yann> Having /root 700 is a good idea, anyway.

Committed, thanks.

-- 
Bye, Peter Korsgaard
