From: lpdev at cordier.org <lpdev@cordier.org>
Date: Wed, 28 Nov 2018 16:28:29 +0100 (CET)
Subject: [Buildroot] Submodule granularity instead of LIB_GIT_SUBMODULES
Message-ID: <ea-mime-5bfeb41d-7336-2fa4e677@www-6.netcourrier.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,



I have a repository that have few submodules:

- myLib

? -> submodule1 (~10MB)

? -> submodule2 (8GB)



Actually I don't need to initialize submodule2 because myLib does not request it while compiling for my buildroot distro.



The option xxx_GIT_SUBMODULES is doing a recursive init on all submodules of the project. As I am using Buildroot 2018.02, there is no support for the latest git patches that improve the overall space overhead and avoid compressing the repo.



Each time I am updating the git hash of my package, buildroot is cloning the repo, getting the subodules (from scratch), compress tar it, and then start the compilation. I was wondering if there is a way to specify _GIT_SUBMODULES to no, but still get the submodule1, without breaking buildroot's download philosophy.



Thank you for your help,

Louis-Paul


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181128/12b28101/attachment.html>
