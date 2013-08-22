From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2013 13:17:10 +0200
Subject: [Buildroot] [PATCH] python-setuptools: Add patch to prevent
 detecting the host installation
In-Reply-To: <5215F201.6090308@zacarias.com.ar>
References: <1377008739-12484-1-git-send-email-markos.chandras@imgtec.com>
 <521527EC.8000307@mind.be>
 <CAGm1_kvOgqynT=gJcxQW=xr_MQeiL8QuxiKAi88QrKADwQY1EQ@mail.gmail.com>
 <CAGm1_ktgXAkpBOQJ4JspAfWKirqQg2SdKOvYH9+on2wKKgHOFw@mail.gmail.com>
 <5215D75E.5080301@mind.be>
 <CAGm1_ksuhkORZYRNw1HPixOjBzRmk3MWgHp_yztMtHsYEyRrLw@mail.gmail.com>
 <5215F201.6090308@zacarias.com.ar>
Message-ID: <5215F336.8050106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/08/13 13:12, Gustavo Zacarias wrote:
> On 08/22/2013 07:36 AM, Yegor Yefremov wrote:
>
> I'll answer on the last mail to make it simpler, otherwise it would be a
> lot of different mails :)
> Basically there's two issues going on here.
>
> First, Markos's patch is still necessary.
> On a gentoo build host which is also a desktop and where setuptools
> installed is "a common thing" thing fails no matter what is done without it.

  Markos's patch, or a yet-to-be-created patch that adds $(TARGET_DIR) to 
the PYTHONPATH instead of passing the system's pythonpath?


> Second, what Arnout said is valid too, but it's correctness rather than
> a fix. python-netifaces doesn't need python-setuptools so that can be
> dropped from DEPENDENCIES and Config.in, and PYTHONPATH in
> HOST_PYTHON_SETUPTOOLS_INSTALL_CMDS is in fact redundant.

  Actually I didn't realize the PYTHONPATH setting for the host variant 
was redundant :-)  I was only talking about the target.


> However if someone wants to concoct a patch for python-setuptools
> there's an additional nag for the target variant - it should
> depend/select BR2_PACKAGE_PYTHON_SSL since pypi forces https these days
> otherwise it'll be a terrible experience.

  But I guess that is a separate patch.

  Anyway I'm not sure if the target variant is that relevant, because it 
will not be able to install anything that requires compilation...

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
