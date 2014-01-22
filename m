From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jan 2014 23:51:11 +0100
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg2: new package
In-Reply-To: <20140122223320.GD3592@free.fr> (Yann E. MORIN's message of "Wed, 
 22 Jan 2014 23:33:20 +0100")
References: <cover.1390242867.git.yann.morin.1998@free.fr>
 <d4f3847e403c1e5c4e8733f75bbfccce6e0b4975.1390242867.git.yann.morin.1998@free.fr>
 <el80raxhff.ln2@ID-313208.user.individual.net>
 <20140120212701.GC3421@free.fr> <20140122223320.GD3592@free.fr>
Message-ID: <8738kfd40w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Ah, yes. This ffmpeg2 patch of mine I did some three months ago. I just
 >> refreshed it yesterday, and forgot to re-check the compatibilty issue.
 >> 
 >> I'll double check what needs to be done, rework the commit log, and
 >> resubmit later.

 > The sets of files installed by each version has a non-null intersection,
 > especially the header files, and the .pc files.

 > The libraries have different versions, indeed, but we still can't
 > install both, as the .so links will point to the latest being installed,
 > which is not predictible.

 > Say for example:
 >   - package 'zzz' depends on ffmpeg (and is incompatible with ffmpeg2)

Do we have any examples of this?

If not, I would simply say that ffmpeg 2.x is the latest and greatest of
ffmpeg, so ffmpeg.mk should build 2.x (and we shouldn't have a
ffmpeg2.mk)

-- 
Bye, Peter Korsgaard
