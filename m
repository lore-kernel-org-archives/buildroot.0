From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Dec 2009 20:29:33 +0100
Subject: [Buildroot] Buildroot with uClibc 0.9.29
In-Reply-To: <6fff79820912181936s2c05be0ap78d0982832446477@mail.gmail.com>
	(Souvik Ghosh's message of "Sat, 19 Dec 2009 09:06:31 +0530")
References: <6fff79820910130628peb87f9bo9c41414b461c0d@mail.gmail.com>
	<6fff79820912181936s2c05be0ap78d0982832446477@mail.gmail.com>
Message-ID: <87bpht1m1u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Souvik" == Souvik Ghosh <mailtosouvik@gmail.com> writes:

 Souvik> Hello All,
 Souvik> I was compiling boost with arm toolchain. This toolchain includes gcc 4.1.1.
 Souvik> While building boost I got the following error -?

 Souvik> boost/boost/regex/v4/basic_regex.hpp:95:35: error: macro
 Souvik> "index" requires 2 arguments, but only 1 given
 Souvik> boost/boost/regex/v4/basic_regex.hpp:100:21: error: macro
 Souvik> "index" requires 2 arguments, but only 1 given

You'll have to dig further into the code to see what index() function it
is referring to. The (legacy) index() function in the C library indeed
takes 2 arguments:

char *index(const char *s, int c);

I expect the code above to refer to a local function called index. You
can probably fix it by renaming it to something else.

 Souvik> Can anybody please helop in this regard. Thanks in advance.

-- 
Bye, Peter Korsgaard
