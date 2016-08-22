From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Aug 2016 21:53:41 +0200
Subject: [Buildroot] [PATCH 1/1] support/download/git: Prioritize remote
	archive
In-Reply-To: <20160817210314.GG5778@free.fr> (Yann E. MORIN's message of "Wed, 
 17 Aug 2016 23:03:14 +0200")
References: <1471461016-9660-1-git-send-email-kamath.ben@gmail.com>
 <20160817210314.GG5778@free.fr>
Message-ID: <87zio4pol6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > NAK in the state.

 > If the package needs submodules, we can't ask the remote to generate
 > the archive for us, because git-archive does not know how to include
 > submodules.

 > So, maybe this would work:

 >     if [ ${recurse} -eq 0 ]; then
 >         if _git blabla remote archive; then
 >             exit 0
 >         fi
 >     fi

Or alternatively, we look at the alternative approach for handling
submodules - E.G. splicing git archive outputs.

 > Also, as stated by Thomas, we want to generate reproducible archives, so
 > that we can check the hashes of archives. We go at great length to
 > generate such archives locally, but I don't see a guarantee that the
 > remote archive would be reproducible.

Normal 'git archive' output should be reproducable, E.G. that is what we
used until recently.

-- 
Bye, Peter Korsgaard
