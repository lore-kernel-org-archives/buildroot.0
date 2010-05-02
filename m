From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 May 2010 22:48:55 +0200
Subject: [Buildroot] [PATCH 08/19] packages: handle interrupted downloads
In-Reply-To: <26f6da8ae60676fbdc21ce33574848fe35cb9749.1272490771.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Wed, 28 Apr 2010 23:40:49 +0200")
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
	<cover.1272490771.git.thomas.petazzoni@free-electrons.com>
	<26f6da8ae60676fbdc21ce33574848fe35cb9749.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87hbmqf2rs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Currently, when package downloads are interrupted, next time you run
 Thomas> Buildroot, it thinks that the download is complete (the file is
 Thomas> present in $(DL_DIR), isn't it ?), which leads Buildroot to extract an
 Thomas> invalid tarball.

 Thomas> Therefore, the DOWNLOAD macro is enhanced to download the file under a
 Thomas> temporary name, and to rename it to the correct name one the download
 Thomas> has completed.

Wouldn't it be simpler / nicer to just add -c (continue) to WGET?

-- 
Bye, Peter Korsgaard
