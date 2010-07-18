From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Jul 2010 23:22:46 +0200
Subject: [Buildroot] [PATCH 2/4] Implement basic non-wget download
	methods
In-Reply-To: <20100716103902.GF16232@bulix.org> (Maxime Petazzoni's message of
	"Fri, 16 Jul 2010 12:39:02 +0200")
References: <L5HQ26$43638E1C3E30A4E7BE70EACE614B0470@aruba.it>
	<20100713113054.GB16232@bulix.org>
	<1279108920.7058.123.camel@cabbage.rehill.info>
	<20100716103902.GF16232@bulix.org>
Message-ID: <871vb0wkm1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Petazzoni <maxime.petazzoni@bulix.org> writes:

Hi,

 >> In a broader sense what are these configuration options for?  Is it to
 >> allow adding switches (e.g. git checkout -f) to the commands or is it to
 >> allow specifying the path to the executable
 >> (e.g. /usr/bin/svn, /opt/git4.0-pre/bin/git)?
 >> If it's the first case, I'd side with GIT_CLONE and GIT_CO.  If it's the
 >> second case, I'd leave it as GIT but get rid of the GIT_CO and just put
 >> the actual command in Makefile.package.in.  Is is likely that they will
 >> ever differ from "clone" or "checkout" anyway?

 Maxime> I don't really know what they are for. Maybe some "older" Buildroot
 Maxime> developers could give us some details there. Because you're right, git
 Maxime> clone will most likely remain git clone. But having the option to use a
 Maxime> specific path is usefull, in which case I'd leave only GIT="git". But
 Maxime> then the same would apply to SVN_CO/SVN_UP where we should only keep
 Maxime> SVN="svn".

Yes, they are really old and not used (besides SVN_CO) - Feel free to
clean this up while making these changes.

-- 
Bye, Peter Korsgaard
