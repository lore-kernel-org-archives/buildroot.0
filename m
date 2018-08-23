From: lpdev at cordier.org <lpdev@cordier.org>
Date: Thu, 23 Aug 2018 17:32:37 +0200 (CEST)
Subject: [Buildroot] Package with dependency with another git
Message-ID: <ea-mime-5b7ed395-49e5-1bbae393@www-1.netcourrier.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


Currently adding a new package to buildroot, I have a package "A" that fetch its sources on git, and is a cmake-package. This package A also require another git repo "B" to be fetched, and a CMake a path in _CONF_OPTS that points to repo "B" must be added. 

My solution was to create a new package "B" on which package "A" depends on, and use generic-package with no build rules. Buildroot is taking care of fetching the sources automatically then.

However I did not find any way to point on build directory of package B from packagea.mk. Package build are named with the following: package_name-version. I am currently pointing to the path manually in my script like this:

PACKAGEA_CONF_OPTS +=? -DREPOB_DIR=$(BUILD_DIR)/packageb-$(PACKAGEB_VERSION)/

My questions are:

- Is it a good practice to do this?
- Is it a good practice to create a package that only fetch sources?
- Is there any variable to point to the build dir of a specific package?
- Would it be better to add a pre-configure in packagea.mk hook that calls git and fetch the repo B?

Thank you for you help.

BR,
Louis-Paul CORDIER


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180823/70e6c207/attachment.html>
