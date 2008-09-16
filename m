From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Sep 2008 20:37:09 +0200
Subject: [Buildroot] Login on a ttyS fails
In-Reply-To: <1221579108.7973.21.camel@chip.lis.inpg.fr> (=?utf-8?Q?=22St?=
	=?utf-8?Q?=C3=A9phane?= Mancini"'s message of "Tue\,
	16 Sep 2008 17\:31\:48 +0200")
References: <1221579108.7973.21.camel@chip.lis.inpg.fr>
Message-ID: <873ak07x9m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "St?phane" == St?phane Mancini <stephane.mancini@grenoble-inp.fr> writes:

 St?phane> Hi,
 St?phane> I'm trying to set up linux on a Xilinx platform.
 St?phane> The boot starts but the root login fails 
 St?phane> after prompting :


Probably you have CONFIG_FEATURE_SECURETTY enabled in busybox and
haven't added ttyUL0 to /etc/securetty.

I'll add it to securetty of target/generic shortly.

 St?phane> I'm using the Xilinx UARTLITE and the driver comming with
 St?phane> linux 2.6.26.2

My driver afaik works correctly.

-- 
Bye, Peter Korsgaard
