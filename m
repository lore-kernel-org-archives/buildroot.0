From: Frank Hoeflich <frankhoeflich@yahoo.com>
Date: Sat, 28 Feb 2009 16:04:39 -0800 (PST)
Subject: [Buildroot] buildbot infrastructure
In-Reply-To: <8763ivkkit.fsf@macbook.be.48ers.dk>
Message-ID: <608983.59657.qm@web56904.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Peter:

    Actually I was hunting for any BR support for the next step - kicking off an automated test cycle after a config builds correctly.  If that doesn't exist yet (and no one else has claimed this turf), I'll go off into a corner and figure out how to write something for buildbot.

    Thank you for putting me into the ballpark.

--Frank

--- On Sat, 2/28/09, Peter Korsgaard <jacmet@uclibc.org> wrote:

> From: Peter Korsgaard <jacmet@uclibc.org>
> Subject: Re: buildbot infrastructure
> To: frankhoeflich at yahoo.com
> Cc: jacmet at uclibc.org, buildroot at busybox.net
> Date: Saturday, February 28, 2009, 12:55 AM
> >>>>> "Frank" == Frank Hoeflich
> <frankhoeflich@yahoo.com> writes:
> 
> Hi,
> 
>  Frank> I tried to look into this and couldn't find
> anything for
>  Frank> buildbot in my copy of the tree.  Is it
> available for
>  Frank> developers to inspect?
> 
> We don't have anything in the tree, but setting up
> buildbot is quite
> easy. I have it running at work for the targets we're
> using.
> 
> Building is just a matter of:
> 
> svn update
> yes ''|make <target>_defconfig
> yes ''|make
> 
> Or in buildbot syntax:
> 
>     f1 = factory.BuildFactory()
>     f1.addStep(SVN(svnurl=SVNURL, mode="copy"))
>     f1.addStep(Configure(command="yes ''|make
> "+target + "_defconfig"))
>     f1.addStep(Compile(command="yes ''|make
> -s"))
> 
> The yes '' stuff is for when buildroot asks for
> user input.
> 
> -- 
> Bye, Peter Korsgaard


      
