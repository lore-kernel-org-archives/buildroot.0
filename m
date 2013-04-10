From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Apr 2013 19:28:45 +0200
Subject: [Buildroot] Building Webkit 1.10.2 using buildroot hangs at
 "Installing to staging Directory"
In-Reply-To: <CAJsG2H6+dJYSjL182RenpR4cArP_kuKj-QoOCBj+gZ8fzkX=2w@mail.gmail.com>
References: <CAJsG2H5S=sm+a2f6m3d4W4A0EraQFu_5JR8J0CCZJ_zz_vKZrg@mail.gmail.com>
 <20130409201534.652f26f1@skate>
 <CAJsG2H6+dJYSjL182RenpR4cArP_kuKj-QoOCBj+gZ8fzkX=2w@mail.gmail.com>
Message-ID: <20130410192845.26687829@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bhupal Singh,

On Wed, 10 Apr 2013 14:13:01 +0530, Bhupal Singh wrote:

> Thanks for immediate reply.
> I am not in the position to share the buildroot.config file.

Then unfortunately we are not in a position to help you.

Please at least create a minimal Buildroot configuration that
reproduces the problem.

> I have attached webkit.mk file from package folder.

It's really unclear to me why you have:

build_webkit:
$(eval $(call AUTOTARGETS,package,webkit))

webkit: build_webkit
	cp -f $(WEBKIT_DIR)/Programs/$(WEBKIT_GTKLAUNCHER) $(TARGET_DIR)/usr/local/bin/

So basically you're using an old version of Buildroot, that you have
modified in bizarre ways (according to your webkit.mk), you can't share
your Buildroot configuration with us, and you expect the community to
help you? It looks like you seem to misunderstand how the open-source
community works, no?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
