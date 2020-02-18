From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 19:19:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/pulseview: depends on host gcc
 >= 4.9
In-Reply-To: <CAPi7W81bL=0TH=gJykPnyCuRPbCyPaH+f+gPkaGpm0qF9Qiizg@mail.gmail.com>
References: <20200216180613.908370-1-fontaine.fabrice@gmail.com>
 <20200218183822.2f6a8e33@windsurf>
 <CAPi7W81bL=0TH=gJykPnyCuRPbCyPaH+f+gPkaGpm0qF9Qiizg@mail.gmail.com>
Message-ID: <20200218191943.70ec90d2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Feb 2020 19:10:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Applied to master, thanks. However, what would be really good is to
> > remove the dependency of libsigrok on host-doxygen. It's a bit annoying
> > that generating the documentation cannot be disabled.  
> doxygen is not only used to generate the documentation.
> sigrok C++ bindings use it to parse libsigrok symbols instead of the
> python pygccxml module since commit
> https://sigrok.org/gitweb/?p=libsigrok.git;a=commit;h=3532ed01256b986ecaf37ea5bb29d81465e2aa89

Ah, yes indeed, I now remember that! Thanks for the reminder. Perhaps
we should write this in libsigrok.mk as doxygen is mostly known as
being a documentation tool.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
