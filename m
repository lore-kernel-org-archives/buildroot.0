From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Dec 2016 08:23:56 +0100
Subject: [Buildroot] [PATCH] kexec: fix build when BR2_STRIP_none=y
In-Reply-To: <789c403c-6dd0-4b7a-e718-9ccfac82be66@mind.be> (Arnout
 Vandecappelle's message of "Wed, 7 Dec 2016 00:48:48 +0100")
References: <1480679517-551-1-git-send-email-marcin.nowakowski@imgtec.com>
 <87a8ce8g6c.fsf@dell.be.48ers.dk>
 <20161202213857.673e4b97@free-electrons.com>
 <877f7i6nry.fsf@dell.be.48ers.dk>
 <20161202223427.7b411a05@free-electrons.com>
 <87inqy57jy.fsf@dell.be.48ers.dk>
 <789c403c-6dd0-4b7a-e718-9ccfac82be66@mind.be>
Message-ID: <87eg1ki4mr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> >> > My other thought is that I believe it's not the first time (see commit
 >> >> > fc174b7057495ebb31393ae27f3ceeefdc490022), so perhaps our idea of
 >> >> > having STRIP=true when BR2_STRIP_none=y is a bad idea, and we should
 >> >> > handle this in a different way.  
 >> >> 
 >> >> The question is how? Create a dummy shell script to better emulate the
 >> >> command line options / behaviour of strip?
 >> 
 >> > I'm not sure. Yet another wrapper kind of sucks. Is it possible to pass
 >> > enough options to strip to have it not strip anything? :-)
 >> 
 >> Not that I'm aware of at least. Anyone?

 >  Why do we have to set TARGET_STRIP to something different when
 > BR2_STRIP_none=y? BR2_STRIP_none is supposed to mean that we don't strip all
 > binaries, it doesn't mean that an individual package isn't allowed to strip its
 > binaries...

Sorry, I don't agree. Quite some packages afaik call $(STRIP) (which we
set to TARGET_STRIP) in their 'make install'. Users don't really care if
binaries are stripped during <foo>-install-target or target-finalize,
the end result for them is the same.

-- 
Bye, Peter Korsgaard
