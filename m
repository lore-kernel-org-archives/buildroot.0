From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sun, 10 Nov 2013 12:18:11 +0100
Subject: [Buildroot] [RFC] Continuous integration
In-Reply-To: <OF5D58F4C2.77D4F569-ON86257C1D.005A57B4-86257C1D.006BA51B@rockwellcollins.com>
References: <1464774.i3ScgRtXEf@sagittae>
 <CAC2S8khWpEpUZiYOrzE2agTXehwW+g5Pkncqdp2PRsc25bT-cw@mail.gmail.com>
 <1649802.VKqnEsp2qV@sagittae>
 <OF5D58F4C2.77D4F569-ON86257C1D.005A57B4-86257C1D.006BA51B@rockwellcollins.com>
Message-ID: <20131110111811.GM26440@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Fri, Nov 08, 2013 at 01:35:46PM -0600, Matthew Weber wrote:
> We might have a fourth semi-continuous integration scenario that prevents 
> server thrashing at each check-in. 
> - We run the script every night processing the current GIT tip at that 
> time. 
> - We clean each of the full cfg builds and let the script do a complete 
> re-build.  (We do this because the individual pkg  cleans aren't 
> guaranteed 
> to cleanup the pkg installs)
> - Once all jobs complete we terminate the script and eventually will send
> the report with status.
> (I'll clean-up what I changed and get it committed.  Would you be up for 
> optional runtime config options?  One might be to enable continuous 
> or a one-stop script execution.)

It's pretty much what I've setup here already:
http://jenkins.free-electrons.com/job/buildroot/

It runs every night and start a clean build of all the configuration
we have if a new commit has been merged.

The only thing missing here is that the emails get only send to Peter,
Thomas P. and I because I didn't want to spam the list, but this can
easily be changed.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131110/6a991dc4/attachment.asc>
