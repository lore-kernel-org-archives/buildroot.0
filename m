From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Mar 2012 23:03:17 +0100
Subject: [Buildroot] Kconfig: "selects" vs. "depends on"
In-Reply-To: <201203041157.15326.arnout@mind.be> (Arnout Vandecappelle's
 message of "Sun, 4 Mar 2012 11:57:15 +0100")
References: <20120304071855.3e6c03b5@gmail.com>
 <CAHXCMMKQjy0Z1Ozn0wu4r14_XQQMWyZTpq3B9kkzJNpj-iUgcw@mail.gmail.com>
 <201203041157.15326.arnout@mind.be>
Message-ID: <87mx7tmlp6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On Sunday 04 March 2012 11:11:58 Samuel Martin wrote:
 >> 2012/3/4 Ismael Luceno <ismael.luceno@gmail.com>:
 >> > Which should I use?
 >> Afaik, "depends on" is transitive, whereas "select" is not, see [1] as ref.

 Arnout>  Actually, no.  Both of them are transitive, but only with
 Arnout> themselves.  So a depends-on chain works, and a select chain
 Arnout> works, but a mix of depends-on and select doesn't.  Bottom line
 Arnout> is: if you use select, you should copy the depends-on
 Arnout> statements of the symbol you select.  Which is one reason why I
 Arnout> claim we should use select as much as possible (to avoid mixing
 Arnout> them).

We use select for normal (library) dependencies, and depends on for "big
things" like toolchain options, Xorg, ..

-- 
Bye, Peter Korsgaard
