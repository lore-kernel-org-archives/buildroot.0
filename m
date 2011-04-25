From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 25 Apr 2011 10:19:49 -0500
Subject: [Buildroot] barking up a different tree
In-Reply-To: <BANLkTinDwQ8zbj_0iBU3bfakNRCuLCb1_w@mail.gmail.com>
References: <BANLkTi=EYF+b=d-LdM=bPXzaZ-7oZh-87A@mail.gmail.com><8762q4aejn.fsf@macbook.be.48ers.dk><4DB33A8A.1000609@carallon.com>
	<BANLkTinDwQ8zbj_0iBU3bfakNRCuLCb1_w@mail.gmail.com>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1FB119A8@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Charles Krinke
> Sent: Saturday, April 23, 2011 4:02 PM
> To: William Wagner
> Cc: buildroot
> Subject: Re: [Buildroot] barking up a different tree
> 
> I understand that one can build it once and move it.
> 
> The issue I have is supporting half a dozen engineers.
> 
> Every time I suggest something not quite logical, I get hours (or
> days) of discussions up to and including "let use OpenEmbedded",
> which I am really tired of hearing.
> 
> So, .... I am trying to get a better way  then the /opt/other.
> 
> 

If you are attempting to build a uClibC toolchain for your engineers, why not just build the toolchain (under /opt/toolchains -- like Peter said), then make a tar ball of that dir and have your eng's unzip it.  Viola!  You have it.   Then, they can build buildroot to their hearts content and all will be great.

Now, to build the external toolchain, you can either use Yann's crosstool-NG, OR, you can have a prelim build of buildroot dropping a toolchain into that dir.  IF your eng's need to build it themselves (I know that feeling, I have a couple that don?t want binaries, they want source) fix that package up and wrap the whole process in a make file.  Keep control over what they do by having them run a build (so that they don?t screw it up).  Save off all your config files to a common dir, then have the make file unpack, update, configure and build the toolchain and the file system.  This isn?t "easy" but it is probably the best thing to do.

Andy
