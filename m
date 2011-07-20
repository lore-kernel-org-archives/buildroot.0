From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 08:02:56 +0200
Subject: [Buildroot] [pull request] Pull request for branch
 for-2011.08/pkg-infra
In-Reply-To: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20110720080256.01c9dcfa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 20 Jul 2011 07:51:59 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Here is a set of improvements to the package infrastructure. Here is a
> quick summary of the improvements :
> 
>  * Add a feature to override the source directory for packages. I had
>    already posted RFC patches of this feature in the past, and
>    additional improvements have been made. I think the feature is
>    ready for wider testing, and if enough people can test and ack this
>    feature, it'd be great to have it merged for 2011.08. See the
>    commit logs of patches 2 and 3 for details.
> 
>  * Add <pkg>-rebuild and <pkg>-reconfigure targets, for each package.
> 
>  * Implement a "local" site method, which allows a package to specify
>    a local directory for its source code, instead of having Buildroot
>    download the tarball from the Web. This can be useful for packages
>    that are always local (while the override feature of the first
>    point is useful for packages that are normally grabbed from a
>    remote location, but that for some reason should be taken from a
>    local directory).
> 
>  * Implement a "file" site method, which allows a package to specify a
>    local tarball for its source code.
> 
>  * Remove the "directory" and "package name" arguments from
>    GENTARGETS, AUTOTARGETS and CMAKETARGETS. Those informations are
>    now automatically infered from the name of the makefile that
>    contains the package recipe (package/multimedia/foobar/foobar.mk ->
>    the directory is "package/multimedia" and the package name is
>    "foobar"). As those patches touch basically all packages, they may
>    not appear on the list due to their size.

I forgot one point: all those changes obviously require a documentation
update. I will work on it if there is an agreement to merge those
changes.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
