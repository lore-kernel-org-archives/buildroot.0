From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 10:09:33 +0100
Subject: [Buildroot] [PATCH 00/15] Reproducible builds
In-Reply-To: <abab99dd97db78785de3ba2f274cac65@sysmic.org>
References: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
 <20161117121341.4a63ed15@free-electrons.com>
 <9798cfe2186532e99707f24481a2a03a@sysmic.org>
 <20161117150855.4b2c99b9@free-electrons.com>
 <abab99dd97db78785de3ba2f274cac65@sysmic.org>
Message-ID: <20161118100933.1093db9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 09:49:51 +0100, J?r?me Pouiller wrote:

> In a first time, compiling each configuration twice, diffing 
> $(TARGET_DIR)
> and find guilty packages using packages-file-list.txt should be enough 
> to find
> a many errors. We may also grep $TARGET_DIR for most common error 
> patterns
> (hostname, user, ...)

OK. So for now we concentrate on timestamp-related variations.

> In a second time, I think reproducible build is an excellent tool to 
> validate top level parallelization.

Yes, right.

> Finally, for more accurate checks, we need to compile same configuration 
> on different host. I didn't check autobuilder sources, but it seems it 
> would involve a new autobuilder design.

This is clearly not possible with the current autobuilder design,
indeed. It will require a fairly major rework. However, we are already
thinking of changing the autobuilder architecture to have the
configuration generated not by the build slaves themselves, but instead
by the server. This could be a first step towards having the server
generate a given configuration, and give it to two separate
autobuilder slaves. But it's a lot of work to do.

> Ideally, "reproducible" mean that a binary result only depends on 
> Buildroot version and user configuration (sure, if a custom script have a 
> non-reproducible behavior, result won't be reproducible).

Right. I believe we should document in the BR2_REPRODUCIBLE help text
what is our current definition of reproducible. I.e that for the moment
we only make builds reproducibles if they are built on the same
machine, in the same path.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
