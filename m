From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 07 Nov 2012 00:46:20 +0100
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <509958D9.7050108@petroprogram.com>
References: <5099186E.1030409@macrium.com> <509958D9.7050108@petroprogram.com>
Message-ID: <5099A14C.5000204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/12 19:37, Stefan Fr?berg wrote:
> Here's what I have minimally in my own buildroot's fs/skeleton/dev folder (which is copied at the end of the buildroot
> process into output/target/dev )

  Err... That can only work if you have sudo in your post-build script - which
we consider bad practice.  We have the device_table to deal with device nodes.
And all of that shouldn't be necessary if you use devtmpfs (or udev or mdev,
which implies devtmpfs).  If you use static device nodes, then the default
device_table_dev creates all of those.

  If that doesn't work for you, then we should try to fix it in buildroot.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
