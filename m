From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 21 Jul 2015 08:12:38 +0200
Subject: [Buildroot] [PATCH/RFC v3 00/50] package/kodi: bump version to
	15.0 rc2 Isengard
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
 <20150719212605.3a908e3f@free-electrons.com>
Message-ID: <XnsA4DE5385A8A24berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150719212605.3a908e3f at free-
electrons.com:

> Bernd,

sorry for answering late, but I was busy yesterday preparing some eventfd-
compatibility code for Kodi 15.0 Isengard: 
https://github.com/xbmc/xbmc/pull/7551
> 
> On Sun, 19 Jul 2015 21:05:05 +0200, Bernd Kuhls wrote:
>> this series is a RFC and not meant for committing to buildroot.
> 
> What about the first 4 patches? Maybe we could start merging them?

patch 1: ffmpeg bump
Please do _not_ commit it yet, because removing 0014-fix-ff-thread-get-
format.patch will break Kodi 14.2, currently part of buildroot.
I saw that you committed it already; when Kodi 15.0 hits buildroot the 
error will go away, until then let?s get ffmpeg 2.7.x tested by the 
autobuilders, mips* has problems with msa.h for example ;) Btw, I will send 
another bump to 2.7.2 today fixing interlaced h264.

patch 2 & 3: no problem, they do not raise compatibility issues

patch 4: please do _not_ commit, libcec3 is incompatible with Kodi 14.

> For the other 46 patches, if they are indeed RFC not meant to be
> committed right now, I'd suggest to mark them as just on Patchwork, if
> you agree.

No problem.

> Maybe you could push the whole thing to a public Git branch so that
> others can quickly test?

Ok, but I have to set this up first. I already have a github account and I 
think I can handle that task.
Can I fork from https://github.com/buildroot/buildroot ?

Regards, Bernd
