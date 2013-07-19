From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Jul 2013 23:30:31 +0200
Subject: [Buildroot] [PATCHv2 4/4] toolchain: instrument external
	toolchain wrapper
In-Reply-To: <20130719161315.GA3751@free.fr> (Yann E. MORIN's message of "Fri, 
 19 Jul 2013 18:13:15 +0200")
References: <574ef0eb7e941dcc6c9dba3540f4aa1c213472bc.1374182572.git.yann.morin.1998@free.fr>
 <1374184490-13855-1-git-send-email-yann.morin.1998@free.fr>
 <871u6vvz2h.fsf@dell.be.48ers.dk> <20130719161315.GA3751@free.fr>
Message-ID: <877ggmutjc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> That's still not really the code style used elsewhere in this file.

 Yann> Doh. What happenned? I've just looked at my tree here, adn the style
 Yann> fixes are applied.

 Yann> OK. All sorted. I did 'git commit --amend'. I should forgot to pass '-a'
 Yann> also (or run 'git add' first).

 Yann> Doh, too bad. Sorry for the inconvenience... :-(

No problem ;)

 >> You could argue that this feature isn't really needed as you can just
 >> run 'strace -s 1000 -e execve <wrapper>' for basically the same
 >> information, but OK - This is perhaps a bit more user friendly.

 Yann> My use-case was to see how the kernel build-system was calling the
 Yann> wrapper. So I just ran:
 Yann>     BR_DEBUG_WRAPPER=1 make
 Yann> in my Buildroot build dir.

So you are only interested in the arguments to the wrapper, or do you
want to see the final arguments to the real compiler?


 >> With that in mind, I think a more sensible output format is something
 >> you can directly cut'n'paste and execute in the shell (after perhaps
 >> tweaking something), so I've changed it to simply print the args space
 >> seperated like this:

 Yann> Yet, one of the motivation behind the \n-separated args was to easily
 Yann> see the args, without having to 'parse' the command line with the eyes.

 Yann> The Linux kernel is passing something like 40+ args to the wrapper, so
 Yann> the line is getting rather long, and difficult to grok visually, while
 Yann> the one-arg per line output made it very easy.

Ok, but a kernel build with 40+ lines per gcc invocation is presumably
also quite overwhelming?


 Yann> Again, sorry for the inconvenience. :-(

 Yann> I already owed you one ${BEVERAGE} in Edimburgh; you can make
 Yann> that two, now! ;-)

heh, sounds good ;)

-- 
Bye, Peter Korsgaard
