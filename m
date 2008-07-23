From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Jul 2008 15:22:13 +0200
Subject: [Buildroot] undefined reference to open64
In-Reply-To: <ea6597e70807230539k29aa1f26idf11872dd03cfeb0@mail.gmail.com>
	(Richard's message of "Wed\, 23 Jul 2008 13\:39\:32 +0100")
References: <ea6597e70807230539k29aa1f26idf11872dd03cfeb0@mail.gmail.com>
Message-ID: <87prp4vipm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Richard" == Richard  <mr.resistor@gmail.com> writes:

 Richard> hey

 Richard> i am building a system with the most recent buildroot
 Richard> snapshot (23/07) for an ARM9 board, which is failing if i
 Richard> try to build php / lighttpd / many others.  they all give
 Richard> the same error message, which is:

 Richard> conf_to_src.c:(.text+0x6c0): undefined reference to `open64'

Sounds like a largefile issue. Did you maybe tweak BR2_LARGEFILE
without doing a complete rebuild (rm -rf *_build_*)?

-- 
Bye, Peter Korsgaard
