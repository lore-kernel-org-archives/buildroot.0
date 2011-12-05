From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Dec 2011 00:13:00 +0100
Subject: [Buildroot] [PATCH v3] Add package connman
In-Reply-To: <4EDD4EAE.7010808@gmail.com> (Daniel Mack's message of "Tue, 06
 Dec 2011 00:07:26 +0100")
References: <4EDCFEB2.60603@gmail.com>
 <1323106241-22192-1-git-send-email-zonque@gmail.com>
 <87fwgyslv8.fsf@macbook.be.48ers.dk> <4EDD4EAE.7010808@gmail.com>
Message-ID: <87bormsjcz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

Hi,

 >> What about installing an initscript? I see there's an example init
 >> script in the connman sources, but that doesn't seem directly applicable
 >> to our busybox based system.

 Daniel> Yes, I can write one up.

Great, thanks.

 Daniel> Yes, this is the reason why I added resolver support to uClibc some
 Daniel> months back, and all the stuff in upstream now.

 >> I don't like to add it if doesn't work with uClibc based toolchains. 

 Daniel> Well, it does, if you enable UCLIBC_HAS_RESOLVER_SUPPORT. What about
 Daniel> adding a dependency for that? If people want to have connman, they have
 Daniel> to manually select this feature and rebuild their uClibc. Does that
 Daniel> sound ok?

In concept, yes - But as the RESOLVER_SUPPORT isn't in any release yet,
it becomes a bit more tricky. We can backport the changes to 0.9.32, but
existing binary toolchains and ctng (unless Yann agrees and we also
backport to there) stuff will fail.

I'll take a look at it.

 >> What configuration are you using it with?

 Daniel> I tested it with both uClibc and Crosstool-NG (eglibc), and
 Daniel> both worked fine for me.

Ok, great.

-- 
Bye, Peter Korsgaard
