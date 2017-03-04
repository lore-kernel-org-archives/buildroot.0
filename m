From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 15:12:28 +0100
Subject: [Buildroot] [PATCH] linux: Add CIP SLTS easy selection option
In-Reply-To: <CA+TH9VkMUTq7sFR9ED9aLgwUCbnnkXyO5uS7fwTyb5CynW2=bg@mail.gmail.com>
References: <1488577816-19047-1-git-send-email-angelo.compagnucci@gmail.com>
 <20170303234636.0dbf4fd6@free-electrons.com>
 <7663394e-1ac6-07ae-a226-159605ac4011@mind.be>
 <20170304000243.35b8b146@free-electrons.com>
 <ecfd4a44-a1b8-19c9-f6c0-ba7998be2c85@mind.be>
 <20170304111105.03e2ffe2@free-electrons.com>
 <CA+TH9Vkxm4VdeBrTWAzWX6YGxrHT2-+OsMpGO0HaNeAHmQAYaw@mail.gmail.com>
 <f66ec9e0-6465-d2b8-eb02-5ada90dcbc75@mind.be>
 <CA+TH9VkMUTq7sFR9ED9aLgwUCbnnkXyO5uS7fwTyb5CynW2=bg@mail.gmail.com>
Message-ID: <20170304151228.3de59a5c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 4 Mar 2017 15:08:06 +0100, Angelo Compagnucci wrote:
> >  Note that the original patch did have a few issues:
> > - It should use a tag/sha rather than a branch;  
> 
> Using a tag/sha will defeat the purpose of using this kernel. A
> developer should ever use the latest release of this kernel each time
> he compiles a buildroot image.

Clearly *NOT*. We want Buildroot builds to be reproducible. So if you
take a given Buildroot version and configuration, it should *always*
provide exactly the same output. So we need to use fixed versions of
all the components.

Doing otherwise would be absolutely horrible. You do a build one day,
it works. The next day, your colleague takes your Buildroot version and
configuration, does a build, and the build fails? Or the build works,
but it no longer boots/works on the target?

So no, we clearly do not want this to use the "latest release each time
a Buildroot image is compiled".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
