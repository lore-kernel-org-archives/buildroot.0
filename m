From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Sep 2013 21:55:06 +0200
Subject: [Buildroot] [PATCHv2 0/4] Add a BR2_EXTERNAL mechanism
In-Reply-To: <CAHt8ZCPjaxG3=c9Qo1gYCjcCgM8h7r4sV+8x-JtQ0a0DEV7cmw@mail.gmail.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHt8ZCPjaxG3=c9Qo1gYCjcCgM8h7r4sV+8x-JtQ0a0DEV7cmw@mail.gmail.com>
Message-ID: <20130914215506.0602b223@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Dawson,

On Sat, 14 Sep 2013 20:39:32 +0100, Simon Dawson wrote:

> > Remaning questions
> > ==================
> >
> >  * Interaction with the 'local.mk' mechanism. Should 'external.mk'
> >    replace the 'local.mk' mechanism? Should they co-exist?
> 
> This is my only slight concern. I would personally prefer to see the
> local.mk mechanism replaced by the new external.mk mechanism; it just
> feels wrong to have both mechanisms in there.

I tend to agree, but there are some differences between the two
mechanisms:

 (1) the location/name of local.mk is defined within the .config, while
 the BR2_EXTERNAL location must be passed as environment variable.

 (2) with the BR2_EXTERNAL mechanism, you _have_ to create a
 BR2_EXTERNAL/Config.in file (even empty), which is not needed with
 local.mk when all what you want is to use the OVERRIDE_SRCDIR
 mechanism.

 (3) The local.mk is included *before* the package .mk files from
 Buildroot (so that the <foo>_OVERRIDE_SRCDIR is defined before
 'foo.mk' is included and calls its generic-package/autotools-package
 macro), while the external.mk file is included *after* all
 Buildroot package .mk files.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
