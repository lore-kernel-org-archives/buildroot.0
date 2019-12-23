From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 23:05:34 +0100
Subject: [Buildroot] [PATCH] support/download/svn: generate reproducible
 svn archives
In-Reply-To: <20191223171658.GN26395@scaer> (Yann E. MORIN's message of "Mon, 
 23 Dec 2019 18:16:58 +0100")
References: <20191222213148.13762-1-heiko.thiery@gmail.com>
 <20191222223650.1f44d3ca@windsurf>
 <CAEyMn7aZgVT2hmb8O4duNFeD4_x2_jkChOj9Cv3MAtVXZhQNLQ@mail.gmail.com>
 <20191222225727.7e8f88d4@windsurf> <20191223171658.GN26395@scaer>
Message-ID: <87zhfiu28h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Normally, it is annoying because it means the hash has changed,
 >> breaking the build for older Buildroot users, if we update the tarballs
 >> on sources.buildroot.org.
 >> 
 >> However, in this case, current Buildroot does not have any hash (as far
 >> as I can see) for Subversion-fetched packages. So we could introduce
 >> your change and update the tarballs on sources.buildroot.org at the
 >> same time, and then introduce hashes in those packages.
 >> 
 >> Peter, Yann, what do you think ?

 > I am 100% on-line with regenerating the tarballs so they are reproducible,
 > even if that means updating s.b.o.

As long as it doesn't break anything for existing users, regenerating
the tarballs are also fine by me.


 >> We have only very few Subversion-fetched packages, I think we should
 >> keep it simple.

 > In practice, we have only two: fis and open2300. The other packages that
 > may use svn are those where the user would set the version, so they
 > would anyway be excluded from the hash check.

Talking about those two packages, weren't we going to remove them? They
are both very old and haven't been updated since they were added.

-- 
Bye, Peter Korsgaard
