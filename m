From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Mar 2018 14:02:20 +0100
Subject: [Buildroot] host-lz4 bug on LTS 2017.02.10
In-Reply-To: <87r2p2d486.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 02 Mar 2018 13:58:01 +0100")
References: <20180302113812.GA29093@salem.gmr.ssr.upm.es>
 <87r2p2d486.fsf@dell.be.48ers.dk>
Message-ID: <87muzqd40z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Alvaro" == Alvaro G M <alvaro.gamez@hazent.com> writes:
 >> Hi,
 >> I've tracked this issue compiling host-lz4. Offending commit is this one
 >> (found via git bisect)

 >> 17cf7e511e6919d5b6744deb21770c2d0ea922a9
 >> lz4: install programs as well as libraries

 >> I attach at the end the defconfig file that produced this log, using
 >> Microblaze, but I've found that the same error happens on x86_64.

 > Please use 2017.02.11 instead. A backport of lz4-1.7.5 was missing on
 > the 2017.02.x branch.

Ehh, sorry  - I haven't actually released 2017.02.11 yet ;)

The missing change from 2017.02.10 is here:

https://git.buildroot.net/buildroot/commit/?h=2017.02.x&id=c849300796b72b58a78514ada88d496f8cab8c70

It would be good if you could try applying this to your tree and then
remove the 32bit support package and validate it works.

-- 
Bye, Peter Korsgaard
