From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 3 Oct 2014 10:03:01 +0200 (CEST)
Subject: [Buildroot] Raspaudio : how to use buildroot as a git submodule
In-Reply-To: <825058379.26083702.1412244610243.JavaMail.root@openwide.fr>
Message-ID: <248328749.26117708.1412323381026.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, I have made quite a few changes, some of them are really interesting

* I have added a big README.md (which needs proofrreading) that covers
  all sorts of interesting things, both on the project and how to 
  customize buildroot in general
* I have removed your Makefile.Project* files, I standardize on a 
  single project being "standard" and multiple projects being
  "advanced" (but it's properly documented)
* I have changed defaults to "change as much as possible with 
  variants. This should not break your use-case since
  * all is set via BR settings, so it can be overridden
  * if it is already set, it won't be overwritten by the
     infrastructure
* I have documented how to have per-project configuration options via
  variables
* I have documented how to use variants to have the toolchain be a 
  separated project. This has been discussed here recently and is 
  rather easy to do with the submodule infrastructure


Feel free to test/break/send me feedback. This is starting to loo really
great.
