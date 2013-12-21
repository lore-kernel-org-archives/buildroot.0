From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 21 Dec 2013 14:10:48 +0100
Subject: [Buildroot] [PATCH] gst-plugins-good: fix typo
	BR2_TOOLCHAIN_HAS_THREAD
In-Reply-To: <20131221093903.22afccf9@skate> (Thomas Petazzoni's message of
 "Sat, 21 Dec 2013 09:39:03 +0100")
References: <8ff8a1a8a7d5dfae8a57.1387486943@argentina>
 <20131220095020.565215ee@skate> <20131220224557.GB3484@free.fr>
 <20131221093903.22afccf9@skate>
Message-ID: <87y53eic2v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Can't we add this information? When you find a symbol, if it's through
 > a depends on or a select, you store the symbol, but mark it as
 > "referenced". When you find a symbol that is really defined through
 > config/menuconfig/choice, you store the symbol and mark it as
 > "defined" (or changed from "referenced" to "defined" if the symbol had
 > already been found). And then, at the end of the parsing, if there are
 > some remaining symbols marked "referenced", whose state has not been
 > changed to "defined", you warn about them.

I was thinking something like that as well. We might not be able to tell
the user where the symbol was referenced, but we can atleast warn that
it wasn't found.

-- 
Bye, Peter Korsgaard
