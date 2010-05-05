From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 May 2010 21:12:44 +0200
Subject: [Buildroot] finding package dependencies
In-Reply-To: <4BE1AE7A.8000107@carallon.com> (Will Wagner's message of "Wed,
	05 May 2010 18:44:26 +0100")
References: <4BE1AE7A.8000107@carallon.com>
Message-ID: <874oimb1sj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Hello,
 Will> Is there some way of finding out a packages dependencies by running a
 Will> make target? Would like to know what a packages dependencies were
 Will> without having to just try building it.

Not a make target, but something like:

awk '/select|depends on/ { print $NF } package/<PACKAGE>/Config.in

gives you a pretty good approximation of it.

-- 
Bye, Peter Korsgaard
