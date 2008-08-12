From: Dirk Vermaak <dirk.vermaak@ntlworld.com>
Date: Tue, 12 Aug 2008 16:20:57 +0100
Subject: [Buildroot]
	=?iso-8859-1?q?Difficulties_with_dynamically_linking?=
	=?iso-8859-1?q?=A0=A0to=A0libasound=2Eso=2E2=2E0=2E0_=28Solution?=
	=?iso-8859-1?q?=29?=
In-Reply-To: <mailman.378.1217857913.1344.buildroot@uclibc.org>
References: <mailman.378.1217857913.1344.buildroot@uclibc.org>
Message-ID: <200808121620.57969.dirk.vermaak@ntlworld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For anyone interested in the future, we know know why our build was failing to 
work.

When linking with -l asound you also need -l pthread in your command. Thus

arm-linux-gcc -fPIC  -oramps DAudio1.1.c  -lasound -lpthread

will make the file ramps from DAudio1.1.c and it will run without seg 
faulting. It appears that you need the pthread library for asound to work.

Cheers,

Dirk
