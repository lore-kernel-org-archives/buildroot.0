From: Willy Lambert <lambert.willy@gmail.com>
Date: Mon, 28 Jan 2013 09:30:18 +0100
Subject: [Buildroot] Adding Orocos as a package
Message-ID: <CAKvQZ_3kYAss=eHAam06WoFEpEzgEQ=_hRTOAz5B=sMPOVsOtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I would like to add Orocos as a package in buildroot
(http://www.orocos.org/). there is an "old" try in Buildroot 2011.05
of Philippe Hamelin there :
https://github.com/phamelin/buildroot/tree/2011.05-sm. As I would like
to update it and propose a patch mainline, here are some questions :

1/_ Is there anyone that have done that before ?

2/_ Orocos is in several indepedent CMake project in independant git
repositories. For convinience they also provide a repository
regrouping all this in a main git repo. So the root dir would be :
orocos_toolchain/
-- rtt (git submodule)
-- ocl (git submodule)
-- log4cpp (git submodule)
-- ..
What should I do ? From the manual I understand that I have to do a
package for each of those subdirs. Is there a way to do
package/orocos/rtt, package/orocos/ocl, ... or should I pur everything
in package ? I don't think there is a way to compile several
independant Cmake projets from a single Buildroot package, but let me
know if this is wrong.

3/ _ Is it possible to select a git branch when cloning the repository
? Something like : "git clone <url> --branch <branch> --single-branch
<folder>". This is required because latest Orocos version is on a
branch and default master is changing often.
