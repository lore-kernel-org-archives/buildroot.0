From: Paul Jones <paul@pauljones.id.au>
Date: Sun, 5 Sep 2010 11:50:34 +1000
Subject: [Buildroot] About Git through SSH
In-Reply-To: <20100904185831.78af11ca@surf>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org><201009030730.57559.minimod@morethan.org><20100903150459.059d682a@surf><201009030937.31967.minimod@morethan.org><20100903170323.3b5a8e6f@surf><000c01cb4bd0$088c14f0$19a43ed0$@pauljones.id.au>
	<20100904185831.78af11ca@surf>
Message-ID: <001201cb4c9c$bc402280$34c06780$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Sunday, 5 September 2010 2:59 AM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] About Git through SSH
> 
> On Sat, 4 Sep 2010 11:25:15 +1000
> "Paul Jones" <paul@pauljones.id.au> wrote:
> 
> > By the way, why does the source get converted to a tar.gz after the
> > git tree is cloned? It's quite annoying because to rebuild the package
> > you have to delete the tar.gz file as well as the build directory to
> > force downloading of the latest source.
> 
> I agree that this is not optimal, but this is the solution that best
follows the
> way Buildroot works currently. If we don't do this, where should Buildroot
do
> the clone ? In the $(BUILD_DIR) which gets deleted by make clean ? Or in
> $(DL_DIR) in a directory form and then we need to do a "cp" to the
> $(BUILD_DIR) when doing the build ?

I was just thinking clone it to $(BUILD_DIR), but on further thought I can
imagine that also would be annoying if your source was rather large.
Perhaps we could put an option in the makefile to force a clone everytime
the package is rebuilt?

> In a second step, it'd be nice to be able to tell Buildroot that for this
or that
> package, instead of being responsible for downloading/extracting it, it
should
> just grab it from a given location. This is, IMHO, a change needed to make
> Buildroot more usable during the development phase, but it needs quite a
> bit of reflection and discussion.

That would be great.
