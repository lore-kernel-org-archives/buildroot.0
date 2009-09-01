From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Sep 2009 07:27:35 +0200
Subject: [Buildroot] Recursive variable `UTIL-LINUX_DEPENDENCIES'
	references itself (eventually).
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB6712C8E5@WETMEX10.loepfe.com>
	(Noel Vellemans's message of "Mon\, 31 Aug 2009 11\:24\:24 +0200")
References: <1531E53627F1F749B4FE809BF2A4EB6712C8E5@WETMEX10.loepfe.com>
Message-ID: <87ab1fqlo8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Noel" == Vellemans, Noel <Noel.Vellemans@visionBMS.com> writes:

 Noel> Hi,

 Noel> Release 2009.08 build stops (current GIT also).


 Noel> Target : ARM (make at91sam9g20dfc_defconfig)


 Noel> package/util-linux/util-linux.mk:75: *** Recursive variable
 Noel> `UTIL-LINUX_DEPENDENCIES' references itself (eventually).  Stop.

Yeah, I noticed as well :/

I broke it in 014df317d47c1 and fixed it again in 49c47f55a87a5b7 -
Sorry about that. You just have change the '=' to a ':='

-- 
Bye, Peter Korsgaard
