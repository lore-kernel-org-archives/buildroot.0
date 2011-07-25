From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Jul 2011 14:19:14 +0200
Subject: [Buildroot] libdrm tries to compile before cairo
In-Reply-To: <AANLkTinJmH7Jsb25KJY6WN5YZaHHKqRJO0ctNA3NmKog@mail.gmail.com>
 (Barry Kauler's message of "Fri, 18 Mar 2011 18:40:17 +0800")
References: <AANLkTinJmH7Jsb25KJY6WN5YZaHHKqRJO0ctNA3NmKog@mail.gmail.com>
Message-ID: <877h76sgcd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Barry" == Barry Kauler <bkauler@gmail.com> writes:

Hi,

Sorry, I know this is an old mail, but here goes anyway.

 Barry> Hi, I am a first-time user of Buildroot. It has been chugging along
 Barry> nicely, but libdrm has failed to compile.

 Barry> It reports that 'cairo.h' is missing. Which it is, cairo has not yet
 Barry> been compiled in the target.

I think the problem is caused by a missing host-pkg-config dependency,
so libdrm ends up using your host pkg-config (and presumably
cairo.pc). I've fixed it in git, care to retest?

-- 
Bye, Peter Korsgaard
