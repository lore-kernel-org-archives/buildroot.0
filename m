From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 Aug 2013 08:24:38 -0300
Subject: [Buildroot] [PATCH] python-setuptools: Add patch to prevent
 detecting the host installation
In-Reply-To: <5215F336.8050106@mind.be>
References: <1377008739-12484-1-git-send-email-markos.chandras@imgtec.com>
 <521527EC.8000307@mind.be>
 <CAGm1_kvOgqynT=gJcxQW=xr_MQeiL8QuxiKAi88QrKADwQY1EQ@mail.gmail.com>
 <CAGm1_ktgXAkpBOQJ4JspAfWKirqQg2SdKOvYH9+on2wKKgHOFw@mail.gmail.com>
 <5215D75E.5080301@mind.be>
 <CAGm1_ksuhkORZYRNw1HPixOjBzRmk3MWgHp_yztMtHsYEyRrLw@mail.gmail.com>
 <5215F201.6090308@zacarias.com.ar> <5215F336.8050106@mind.be>
Message-ID: <5215F4F6.4030701@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/22/2013 08:17 AM, Arnout Vandecappelle wrote:

>  Markos's patch, or a yet-to-be-created patch that adds $(TARGET_DIR) to
> the PYTHONPATH instead of passing the system's pythonpath?

That's possible too, testing required :)

>  Actually I didn't realize the PYTHONPATH setting for the host variant
> was redundant :-)  I was only talking about the target.

PYTHONPATH for the target is required because it's sometimes hardcoded
in installed packages unfortunately - i don't recall the exact
combination that triggered it at the moment, or it may have been some
additional python package that i used for testing and never sent
(useless, not interesting) when fixing the shebang and other details.

>  But I guess that is a separate patch.
> 
>  Anyway I'm not sure if the target variant is that relevant, because it
> will not be able to install anything that requires compilation...

Yes, something for someone to up their buildroot cred :)
I'm unsure if we want to encourage the target setuptools, there are
packages that'll install fine, and as you say the compiler ones will
fail miserably.
I'd keep it to avoid unnecessary noise and complaints with a big fat
warning that it's not the buildroot way and it's just for convenience
(and to forget about the target toolchain!).
Regards.
