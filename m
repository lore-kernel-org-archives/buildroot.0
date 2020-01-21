From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Jan 2020 22:01:28 +0100
Subject: [Buildroot] Package for MDSPlus
In-Reply-To: <a820569b0f4443fb9f2aa060e1d81c24@EMAIL.tae.trialphaenergy.com>
References: <a820569b0f4443fb9f2aa060e1d81c24@EMAIL.tae.trialphaenergy.com>
Message-ID: <a9c8f0cc-a9b8-93de-53d4-decfc5d6ab15@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Andrew,

On 17/01/2020 22:18, Andrew Alexander wrote:
> Hello everyone,
> I received excellent help from y_morin and vfazio in the buildroot IRC, as such I would like to share the results.

 Thank you for your contribution!


> MDSPlus is a networked database system for nuclear fusion and particle accelerator research labs (see www.mdsplus.org<http://www.mdsplus.org>). Its focus is on carefully and clearly organizing large bursts of data by time.
> 
> Buildroot now supports binaries built to use MDSPlus libraries through the enclosed attachments.

 However, please submit it as a patch to the Buildroot git tree, as explained in
the documentation [1]. In particular, make sure the commit message carries a
Signed-off-by tag, which is your contributor agreement.

 Also a few things are missing in the files you attached:

- Each patch should have a description (like a commit message) which also
includes your Signed-off-by. A Signed-off-by is needed again because the patch
will have to follow the license of the upstream project, not Buildroot's GPL-2.0
license.

- Since the upstream project is based on git, the patches should be
git-formatted (i.e., generated with `git format-patch -N`).

- There should be a hash file, which contains a hash of the tarball and of each
license file.

- The tarball is an automatically generated tarball, so it should use the github
helper instead of a direct URL.

- In Config.in, BR2_PACKAGE_LIBXML2 should be select'ed instead of depended on.

- The BR2_PACKAGE_MDSPLUS_SERVER option is not used.

- There shouldn't be a hardcoded path to a microblaze toolchain.

- The license is GPL-2.0, not GPLv2 (SPDX format).

- You should add it to package/Config.in or it won't be visible in the menu.

- You should add yourself to the DEVELOPERS file.

 Thanks!

 Regards,
 Arnout



[1] https://buildroot.org/downloads/manual/manual.html#submitting-patches

> 
> Thanks for your attention,
> ~A
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
