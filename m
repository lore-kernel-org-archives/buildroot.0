From: g4 at novadsp.com <g4@novadsp.com>
Date: Sat, 29 Apr 2017 18:08:06 +0100
Subject: [Buildroot] [PATCH 1/1] mke2img: Sanity check block size and
	fail if zero or missing.
In-Reply-To: <20170429160215.GA19584@scaer>
References: <1493477884-121871-1-git-send-email-g4@novadsp.com>
 <20170429160215.GA19584@scaer>
Message-ID: <11d301d2c10b$2cb73190$862594b0$@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

> 
> >      # Sanity checks
> >      if [ -z "${root_dir}" ]; then
> > -        error "you must specify a root directory with '-d'\n"
> > +        error "Error: you must specify a root directory with '-d'\n"
> >      fi
> >      if [ -z "${image}" ]; then
> > -        error "you must specify an output image file with '-o'\n"
> > +        error "Error: you must specify an output image file with '-o'\n"
> 
> Is that really necessary?

The original justification was for any user calling the script directly. Now I think no, it is not.
 
> 
> There is an obvious error here: there is a missing space between '0' and the
> closing bracket ']'.

Indeed. <facepalm>
 
> However, I wonder why we should check for a zero size. The filesystem will
> be non-creatable (is that a word?) because the requested size is too low,
> similar to what a user would get by settign the nb_blocks to
> (e.g.) 1024 (i.e. 1MiB) but have a target/ that is 2MiB: that won't fit.
> 
> So, I would just keep the check to being set, whatever the value (but I would
> not oppose the check against 0 either.)

My revised version applies a check in the ext2.mk file itself. I think this is much cleaner.

Best,

Jerry.
