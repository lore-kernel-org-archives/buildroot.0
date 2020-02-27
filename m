From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 22:32:48 +0100
Subject: [Buildroot] Untractably slow CVE checks in
 support/scripts/pkg-stat
In-Reply-To: <20200227175443.71a6461f@windsurf> (Thomas Petazzoni's message of
 "Thu, 27 Feb 2020 17:54:43 +0100")
References: <ac23d55f-c8a5-587d-2c98-5967f3abfa14@railnova.eu>
 <20200227175443.71a6461f@windsurf>
Message-ID: <87mu93lnr3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Titouan,
 > On Thu, 27 Feb 2020 16:05:41 +0100
 > Titouan Christophe <titouan.christophe@railnova.eu> wrote:

 >> 1. Uninstall the version distributed by apt:
 >> `apt remove python-ijson`
 >> 2. Install the latest version with pip:
 >> `pip install [--user] ijson`
 >> 3. Start the pkg-stat script, it should complete in less than 5 minutes.

 > Thanks a lot for the investigation and research!

 > I tested with ijson 2.6 installed from pip, and things are indeed a lot
 > better. It's not 5 minutes though:

 > real	19m55.557s
 > user	18m7.632s
 > sys	1m53.140s

Ok, but still almost an order of magnitude faster - Thanks!

If needed, I think we can get most of the speedup even with the older
2.3 version packaged in Debian/Ubuntu by selecting a better backend than
the fallback python version that used to be default - E.G. something
like what was done automatically from version 2.5 onwards:

https://github.com/ICRAR/ijson/commit/4c6d4144ea56e883634bd8c3eddca02c6f54a8f7

But I'm not sure if it is worth the trouble.

-- 
Bye, Peter Korsgaard
