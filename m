From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Nov 2011 23:22:28 +0100
Subject: [Buildroot] Status of valgrind on powerpc
In-Reply-To: <CAAXf6LVTAU73avFA3BJXEvcbVoQj6er1PFg-ntjLo9F3tc6hOA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Thu, 3 Nov 2011 10:27:58
 +0100")
References: <CAAXf6LUVQc9JRgoOiKy84BnsiRLqXOxHbd6k+1RzQMpRQA4T0w@mail.gmail.com>
 <20110929121549.4bb68988@skate> <20110930214150.770f09e1@skate>
 <CAAXf6LUKtv1Cs-gEfGj4Aq9wLe3N0tiKHDxniv39dW+RwoQOjw@mail.gmail.com>
 <20111001113902.2aeff98d@skate>
 <CAAXf6LXV-aQgMNarenZa0ZpWpytQZKbeBnL83wKr5E-eK_bCOA@mail.gmail.com>
 <CAAXf6LVTAU73avFA3BJXEvcbVoQj6er1PFg-ntjLo9F3tc6hOA@mail.gmail.com>
Message-ID: <87y5vrd13v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 Thomas> Possible solutions?
 Thomas> 1. Modify uClibc so that it does not depend on the linux a.out.h file,
 Thomas> but rather provides its own definitions as eglibc does.
 Thomas> 2. Modify the kernel so that powerpc also provides a.out.h

I looked into this a few years ago, and option 2 is not an option as the
aout stuff is old and shouldn't be used:

https://lkml.org/lkml/2008/6/15/126

 Thomas> 3. Modify buildroot to state that valgrind can not be build with uClibc.

4. Fix valgrind to not include a.out.h

It's not really used for much - Have you seen this thread?

http://old.nabble.com/How-to-disable-the-a.out-support-of-valgrind-td29226733.html

-- 
Bye, Peter Korsgaard
