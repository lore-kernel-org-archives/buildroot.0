From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Nov 2012 09:50:54 +0100
Subject: [Buildroot] [PATCH 10/21] xinetd: add support to use RPC
	support from libtirpc
In-Reply-To: <94b700ff4570051f6408d4264efcbff74ae014cd.1352050008.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 4 Nov 2012 18:34:18 +0100")
References: <cover.1352050008.git.thomas.petazzoni@free-electrons.com>
 <cover.1352050008.git.thomas.petazzoni@free-electrons.com>
 <94b700ff4570051f6408d4264efcbff74ae014cd.1352050008.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87390oph5d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

It unfortunately fails here:

confparse.o: In function `cnf_get':
confparse.c:(.text+0x1174): undefined reference to `getrpcbyname'
collect2: ld returned 1 exit status
make[2]: Leaving directory `/home/peko/source/buildroot/output/build/xinetd-2.3.15/xinetd'

getrpcbyname() apparently seems to be behind a 'GQ' define in libtirpc.

Care to look into that?

Also notice that we recently added conntrack-tools, which should also
get libtirpc support.

-- 
Bye, Peter Korsgaard
