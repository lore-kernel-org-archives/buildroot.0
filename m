From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Feb 2017 22:10:51 +0100
Subject: [Buildroot] rsyslog plugin selection
In-Reply-To: <CAAXf6LUgTQBZK7HnzKd6q64XnAA7nX_n7X3LDdRZfEvKtfeq7w@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 8 Feb 2017 21:28:01
 +0100")
References: <CAAXf6LUgTQBZK7HnzKd6q64XnAA7nX_n7X3LDdRZfEvKtfeq7w@mail.gmail.com>
Message-ID: <8737fopew4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > Hi,
 > The rsyslog package in Buildroot currently hardcodes the list of
 > plugins to enable. These plugins define what types of input, output,
 > parsing, etc. is supported, and is typically very application
 > dependent.

 > The current selection amounts to about 1 MB of rootfs, while the
 > rsyslog daemon itself is only about half of that. By restricting the
 > list of plugins to those a project actually needs, it is thus possible
 > to reduce the size of the rootfs.

 > Two questions arise:
 > 1. should we use one config symbol with a string list, or separate
 > config symbols for each plugin?

 > 2. should we keep the current set as default, even if it contains less
 > common options?

Separate config options are IMHO quite a lot more user friendly, so if
we are not talking about a LOT (20+) of options then that is what I
would prefer.

-- 
Bye, Peter Korsgaard
