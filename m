From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 23:42:30 +0100
Subject: [Buildroot] [RFC] openssh: add option to allow login as root
In-Reply-To: <20190319114156.10696-1-esben.haabendal@gmail.com> (Esben
 Haabendal's message of "Tue, 19 Mar 2019 12:41:56 +0100")
References: <20190319114156.10696-1-esben.haabendal@gmail.com>
Message-ID: <87mulqebah.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Esben" == Esben Haabendal <esben.haabendal@gmail.com> writes:

 > From: Esben Haabendal <esben@haabendal.dk>
 > What do you think. Is this kind of micro-management of a configuration
 > file something that I should keep out of tree?

We discussed it tonight on IRC and didn't really get to a good compromise.

On one hand, we prefer to stick with upstream defaults (especially when
security is involved), but it is true that dropbear allows root logins
by default. We prefer to not add configuration options for these kind of
detailed policy decisions, as openssh has a LOT of other configuration
options - But silently allowing root logins when we have "always"
disallowed it in the past also isn't nice.

So all in all, this kind of policy tweaks are better done in a post
build script.

-- 
Bye, Peter Korsgaard
