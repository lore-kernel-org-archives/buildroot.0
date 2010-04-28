From: Paul Jones <paul@pauljones.id.au>
Date: Thu, 29 Apr 2010 09:26:14 +1000
Subject: [Buildroot] [PATCH 08/19] packages: handle interrupted downloads
In-Reply-To: <26f6da8ae60676fbdc21ce33574848fe35cb9749.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
	<26f6da8ae60676fbdc21ce33574848fe35cb9749.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <000f01cae72a$31ebcc60$95c36520$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Thursday, 29 April 2010 7:41 AM
> To: buildroot at uclibc.org
> Cc: Thomas Petazzoni
> Subject: [Buildroot] [PATCH 08/19] packages: handle interrupted downloads
> 
> Currently, when package downloads are interrupted, next time you run
> Buildroot, it thinks that the download is complete (the file is present in
> $(DL_DIR), isn't it ?), which leads Buildroot to extract an invalid
tarball.
> 
> Therefore, the DOWNLOAD macro is enhanced to download the file under a
> temporary name, and to rename it to the correct name one the download
> has completed.


Would it be possible to add automatic download resume support while you are
at it?



Paul.
