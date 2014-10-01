From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 1 Oct 2014 16:08:32 +0200 (CEST)
Subject: [Buildroot] Raspaudio : how to use buildroot as a git submodule
In-Reply-To: <1723661717.26039623.1412168336757.JavaMail.root@openwide.fr>
Message-ID: <1280276802.26043432.1412172512257.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Looking into it a bit deeper, I have a couple of questions for you..

in your current layout 

* BR2_EXTERNAL is shared, so Config.in is shared and external.mk 
is shared
* each project has its own overlay
* each project has its own local.mk
* each project has its own patch subdirectory...
* dl is shared

so I need to understand your use-case a little more. 
As I said my use case is "same project, but different hardware" so
my favorite layout would be

* shared BR2_EXTERNAL
* shared overlay
* shared patches
* different config files
* don't care about local.mk, might as well make it different

This layout makes more sense to me (shared overlay and shared patches)
but I want to make sure it fits your use-case before I do the change

It makes little sense to me to have completely different projects
which are just sharing dl/ since dl is not saved in git and it's
more handy to have completely separate git repo in this case...


If you can tell me a little more, I'll see how I adapt this...
