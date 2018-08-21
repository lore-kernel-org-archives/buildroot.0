From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 21 Aug 2018 23:00:13 +0200
Subject: [Buildroot] [PATCH/next 2/3] package/perl-crypt-openssl-random:
 bump version to 0.15
References: <20180819181558.15338-1-bernd.kuhls@t-online.de>
 <20180819181558.15338-2-bernd.kuhls@t-online.de>
 <20180819231557.62acd467@windsurf> <20180819232523.42a4635f@windsurf>
Message-ID: <t3bu4fx95s.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 19 Aug 2018 23:25:23 +0200 schrieb Thomas Petazzoni:

> In fact, more serious question: figuring out the path to OpenSSL
> libs/headers is something that is needed at build time. But you're
> adding perl-crypt-openssl-guess as a target package. I don't understand
> how it makes sense. Could you clarify ?

Hi Thomas,

I did not forget about answering your question, was just busy with the 
security bump for libX11 ;)

In fact you were right about that only the host package is needed.
I guess during the build tests I mixed up the target and host versions, 
first I used the target package, which caused an error in the other 
packages, then I tried the host package, which was broken as well (but I 
kept its files in the host install of perl), then switched back to the 
target package, still broken, and at last I added the "OPENSSL_PREFIX=" 
hack to the target package which, together with the still installed host 
files, produced working builds of perl-crypt-openssl-{random, rsa}. But I 
did not notice that really the host files were, together with the hack, 
were responsible for the sucessful build.

Sorry for the confusion ;)

Regards, Bernd
