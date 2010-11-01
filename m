From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 01 Nov 2010 12:40:45 +0100
Subject: [Buildroot] Wrong DST flag
In-Reply-To: <AANLkTi=0G-3NsBbb0gw9UcWhENKLhw-A0LWqjuweLfDG@mail.gmail.com>
	(Viktar Palstsiuk's message of "Mon, 1 Nov 2010 12:04:51 +0200")
References: <AANLkTi=0G-3NsBbb0gw9UcWhENKLhw-A0LWqjuweLfDG@mail.gmail.com>
Message-ID: <87tyk1b7b6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Viktar" == Viktar Palstsiuk <viktar.palstsiuk@promwad.com> writes:

 Viktar> Hello,
 Viktar> I've noticed that my target based on buildroot shows incorrect time.
 Viktar> The issue is caused by wrong DST flag. The `date +%Z` still shows that
 Viktar> it is summer time now but time supposed to be switched to standard
 Viktar> time on October 31 at 3 a.m. (according to Russian rules)

 Viktar> # cat /etc/TZ
 Viktar> MSK-3MSD
 Viktar> # date +%z
 Viktar> +0400
 Viktar> # date +%Z
 Viktar> MSD
 Viktar> # date
 Viktar> Mon Nov  1 13:55:09 MSD 2010

 Viktar> I'm using uClibc-0.9.31, busybox-1.17.0, buildroot-20100715.

We don't do anything special about timezone in buildroot, so forwarding
to the uclibc list.

-- 
Bye, Peter Korsgaard
