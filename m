From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Apr 2018 14:55:12 +0200
Subject: [Buildroot] Per-package download folders and Git caching
In-Reply-To: <20180403141703.21cd24fe@windsurf>
References: <20180403141703.21cd24fe@windsurf>
Message-ID: <041a5a2a-3f9d-c76e-4c6d-d22ef11cad43@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,

 Excellent write-up!

On 03-04-18 14:17, Thomas Petazzoni wrote:
> However, it is likely that many users already have a DL_DIR with a
> number of files. What the new Buildroot will do is that it will first
> check if the requested file is in the per-package sub-folder. If it is
> not found there, it will then try to see if it is in the main DL_DIR,
> and if that's the case, it will create a hard link of this file into
> the per-package sub-folder. Therefore, you will see something like:
> 
>  + dl/
>    + linux-v4.16.tar.bz2
>    + linux/
>      + linux-v4.16.tar.bz2
> 
> But the Linux tarball is not duplicated, it is only hard-linked.

 I know a few users that put their download directory on a samba share or a
virtualbox/vmware share which has NTFS as underlying filesystem. Although NTFS
does support hardlinks, I'm not sure that Samba and virtualbox/vmware do. Any
idea what will happen in such a case?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
