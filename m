From: Paul Jones <paul@pauljones.id.au>
Date: Wed, 30 Jun 2010 21:03:22 +1000
Subject: [Buildroot] Kernel build process
Message-ID: <002401cb1843$dc1e2670$945a7350$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

 

Just some comments about the new kernel cleanup code. If a kernel config is
not supplied, the default action is to stop with a rather cryptic error.
This doesn't seem like a good idea to me, especially when the previous
behaviour was to just create a default .config and continue. I can see a lot
of beginners getting caught out with that one.

 

What I would like to suggest is this:

1)      Change the default Kernel Configuration to "Using a custom config
file" (is currently set to use a defconfig)

2)      Leave "Configuration file path" blank as default

3)      Add code to ignore copying config file if "Configuration file path"
is still blank and just continue compiling the kernel with the default
options.

 

That way it should be obvious to any beginners what the options do, and if
they are not set (ie left as default) the build will still be able to
continue.

 

 

Thoughts?

 

 

Paul.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100630/3e06bcb6/attachment.html>
