From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Sep 2015 23:23:42 +0200
Subject: [Buildroot] [PATCH] subversion: bump to version 1.9.2
In-Reply-To: <1443090000-41954-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1443090000-41954-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150927232342.29d7ee6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 24 Sep 2015 11:20:00 +0100, Vicente Olivert Riera wrote:

> -SUBVERSION_VERSION = 1.7.19
> +SUBVERSION_VERSION = 1.9.2
> +SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
>  SUBVERSION_SITE = http://archive.apache.org/dist/subversion

As of right now, this location doesn't work:

thomas at skate:~/projets/buildroot (subversion-bump)$ make subversion-extract
>>> subversion 1.9.2 Downloading
--2015-09-27 23:21:07--  http://archive.apache.org/dist/subversion/subversion-1.9.2.tar.bz2
Resolving archive.apache.org (archive.apache.org)... 140.211.11.131, 192.87.106.229, 2001:610:1:80bc:192:87:106:229
Connecting to archive.apache.org (archive.apache.org)|140.211.11.131|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2015-09-27 23:21:07 ERROR 404: Not Found.

And indeed, I don't see 1.9.2 in
http://archive.apache.org/dist/subversion/, the latest is 1.9.1, even
if 1.9.2 is advertised as the latest version at
https://subversion.apache.org/download.cgi#recommended-release, and
available from other mirrors.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
