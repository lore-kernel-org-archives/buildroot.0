From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2011 16:19:43 +0200
Subject: [Buildroot] Feature request - pull sources from repose
In-Reply-To: <5725744097739393062@unknownmsgid>
References: <5725744097739393062@unknownmsgid>
Message-ID: <20110707161943.714c9791@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 7 Jul 2011 10:06:18 -0400,
James Hanley <jhanley@dgtlrift.com> a ?crit :

> Right now, buildroot downloads sources from released tarball urls, it
> would be great if they could also pull from source repositories (git,
> svn, etc.) to get unreleased features. For example I ran into an issue
> with uclibc which was fixed but not yet released.  It may also assist
> in weeding out integration issues before package release.

This is already implemented. In a package, you can do :

<pkg>_SITE = git://foobar.com/barfoo.git
<pkg>_SITE_METHOD = git
<pkg>_VERSION = some-git-tag-or-commit-id-or-branch

Same with Subversion and Bazaar.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
