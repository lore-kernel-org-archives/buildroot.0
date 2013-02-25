From: Francesco Montorsi <francesco.montorsi@gmail.com>
Date: Mon, 25 Feb 2013 19:59:42 +0000 (UTC)
Subject: [Buildroot] force buildroot to regenerate the output/target
	directory tree
References: <loom.20130225T144049-821@post.gmane.org>
 <20130225151637.078e3155@skate>
Message-ID: <loom.20130225T205428-835@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@...> writes:
> > does a "rm -rf output/target && make" works? 
> 
> No, it doesn't work, and as of today, there isn't really a simple and
> reliable way of doing that.
ok... I think it would be nice to add one, though!
 
> How long is your entire build? What is your configuration (post
> your .config if possible)? Do you have an external toolchain? Have you
> used ccache? Are you perhaps building inside a virtual machine and/or
> on a slow laptop?
my build is about 1h on an core i5... yes: I'm using ccache.
Anyway, it's not really a matter of compilation flags / development machine. The 
point is that in a development stage I often find myself doing several small 
changes in the configuration files and other stuff (in a SVN environment); then 
I copy them in the output/target tree... my point is that I would like to be 
sure that there are no leftovers from previous cp commands I issued.

Perhaps I can do:
  make   # in buildroot folder
  cp -rf output/target output/targetVANILLA
  cp -rf /mystuff output/target
  make   # to generate images containing my customized stuff in output/images

and then

  rm -rf output/target 
  cp -rf output/targetVANILLA output/target

to start over in the future.

Perhaps skeletons are the most clean way to do that... I will look into it as 
soon as I find the time!

THanks,
Francesco
