From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Jul 2017 14:47:25 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: export O= to
	post-build/image scripts for out-of-tree builds
In-Reply-To: <dca9fa93-e6f8-10d9-f166-02f981b4f0a3@mind.be> (Arnout
 Vandecappelle's message of "Mon, 17 Jul 2017 23:34:01 +0200")
References: <20170714130417.18857-1-peter@korsgaard.com>
 <7d2448b0-800c-cb14-657b-907d380787f8@mind.be>
 <871spe92ci.fsf@dell.be.48ers.dk>
 <dca9fa93-e6f8-10d9-f166-02f981b4f0a3@mind.be>
Message-ID: <87wp757vz6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Yes, that can also work - Even though it is less obvious that you should
 >> run make O=${BASE_DIR} inside the post build/image scripts, instead of
 >> make O=$O

 >  OK, but having both exported seems a bit silly...

Correct. I would argue that O is somewhat nicer than BASE_DIR, as the
user is already using O= (and if they don't use O=, then they also don't
need to pass it in post-build/post-image scripts), but we have exported
and documented BASE_DIR for some time now, so we cannot really get rid
of it.

 >> >  O has the problem that it's too risky to lead to conflicts IMO.
 >> 
 >> Even for post build/image scripts? What use cases do you have in mind
 >> where there could be conflicts?

 >  True, in EXTRA_ENV the risk is minimal - especially since Kbuild and
 > derivatives (like Buildroot) ignore an O passed through the environment.

Indeed.

I don't feel strongly pro/con, what do others say?

-- 
Bye, Peter Korsgaard
