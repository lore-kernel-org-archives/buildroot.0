From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Oct 2015 23:46:08 +0100
Subject: [Buildroot] [git commit] package/initscripts: S40network: wait
	for network interfaces to appear
In-Reply-To: <562FFD19.8020204@mind.be> (Arnout Vandecappelle's message of
 "Tue, 27 Oct 2015 23:39:21 +0100")
References: <20151016111136.50FA381F8A@busybox.osuosl.org>
 <CAMQcK5K7pKFBoN9N2hv4oLscew6qTWvj9RhfiCviLako0VzdRg@mail.gmail.com>
 <562F426C.4010500@green-communications.fr> <562FFD19.8020204@mind.be>
Message-ID: <871tcg7wwf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> In this case, S40network will wait forever.  However, if the feature
 >> was implemented via ifupdown pre-up hooks, then this use-case could
 >> actually work, since hooks are executed after pre-up stanzas. But that
 >> is maybe too complex for buildroot.

 >  Actually, this sounds less complicated than the script we currently have.

 >  At least, if both busybox and ifupdown behave the same way.

Yes, this was already discussed:

http://lists.busybox.net/pipermail/buildroot/2015-October/142329.html

But Jerome didn't send a patch yet. The only disadvantage would be that
the timeout is per-interface instead of globally, but that is imho not
that bad.

 >  Does systemd use /etc/network/interfaces and/or the hooks?

I don't think so.

-- 
Venlig hilsen,
Peter Korsgaard 
