From: Bhupal Singh <singhbhupal88@gmail.com>
Date: Fri, 12 Apr 2013 13:49:06 +0530
Subject: [Buildroot] Fwd: Building Webkit 1.10.2 using buildroot hangs at
 "Installing to staging Directory"
In-Reply-To: <CAJsG2H55rEtfLYk+7DQ4JkgbfCUefErc4Ui9tyt8XLsDis6OHw@mail.gmail.com>
References: <CAJsG2H5S=sm+a2f6m3d4W4A0EraQFu_5JR8J0CCZJ_zz_vKZrg@mail.gmail.com>
 <20130409201534.652f26f1@skate>
 <CAJsG2H6+dJYSjL182RenpR4cArP_kuKj-QoOCBj+gZ8fzkX=2w@mail.gmail.com>
 <20130410192845.26687829@skate>
 <CAJsG2H55rEtfLYk+7DQ4JkgbfCUefErc4Ui9tyt8XLsDis6OHw@mail.gmail.com>
Message-ID: <CAJsG2H5hWBRtUmegdvvWaGQ00drTe7znAZ8CGHfmRX723iwsrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---------- Forwarded message ----------
From: Bhupal Singh <singhbhupal88@gmail.com>
Date: Fri, Apr 12, 2013 at 1:46 PM
Subject: Re: [Buildroot] Building Webkit 1.10.2 using buildroot hangs at
"Installing to staging Directory"
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>


Dear Thomas,

First of all I am really very sorry that I could not share the buildroot
.config file with you, I clearly understand the working of open-source
community, without sharing the buildroot .config file you may not be able
to help me, but things are little confidential here that is the reason I am
not in a position to share stuffs with you.

Yeah you found it right I am using the older version of buildroot, which as
of now I can't upgrade to the latest version, doing so will require me to
put lot of effort, since we have build many packages other than the
buildroot default packages with the older version of buildroot.

Well, I digged on the issue further more and came to the point that the
issue is not with the buildroot it was with webkitgtk1.10.2 where I was
using the config option as --disable-jit. The issue got resolved by adding
few lines of code in webkitgtk source code.

I really appreciate your kindness to help me and sorry for the
inconvenience caused.
Looking forward to take help from you when we try to upgrade the buildroot
to the latest version, Hope so I will be in a position to share stuffs with
you.

Thank you,

-- 
Warm Regards,
Bhupal Singh


On Wed, Apr 10, 2013 at 10:58 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Bhupal Singh,
>
> On Wed, 10 Apr 2013 14:13:01 +0530, Bhupal Singh wrote:
>
> > Thanks for immediate reply.
> > I am not in the position to share the buildroot.config file.
>
> Then unfortunately we are not in a position to help you.
>
> Please at least create a minimal Buildroot configuration that
> reproduces the problem.
>
> > I have attached webkit.mk file from package folder.
>
> It's really unclear to me why you have:
>
> build_webkit:
> $(eval $(call AUTOTARGETS,package,webkit))
>
> webkit: build_webkit
>         cp -f $(WEBKIT_DIR)/Programs/$(WEBKIT_GTKLAUNCHER)
> $(TARGET_DIR)/usr/local/bin/
>
> So basically you're using an old version of Buildroot, that you have
> modified in bizarre ways (according to your webkit.mk), you can't share
> your Buildroot configuration with us, and you expect the community to
> help you? It looks like you seem to misunderstand how the open-source
> community works, no?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130412/172e3c09/attachment.html>
