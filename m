From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Fri, 7 Nov 2008 18:16:40 +0100
Subject: [Buildroot] how to get the rootfs rebuilded ?
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAANxvIbP3pP1EiLoe96b5TKYBAAAAAA==@cimeq.qc.ca>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAANxvIbP3pP1EiLoe96b5TKYBAAAAAA==@cimeq.qc.ca>
Message-ID: <e4c675870811070916r2e00872gdd1612e0a0d8bf1f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/11/7 Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>:
> Hi all,
>
> I have compiled all my buildroot, and I would like to modify the root file
> system directory customized. I would like to know what is the precess to
> have the root file system rebuilded.
>
> Do I need to remove some .file to force makefile to reinstall the root
> directory (under /project_build_ARCH_project/root) ?

Please try the last patch attached in this reports

 http://busybox.net/bugs/view.php?id=5614

Do make help so see it adds these target:

  rootclean              - delete all rootfs content

  install                - (re)install rootfs but not skeleton if it exists

which probably solve your problem.

Please notice this patch apply in r23927 and probably it works for
other releases too.

If you find it useful please send on this m-list a feed back because
the patch has not been received enough consensus to be committed in
the svn

 Enjoy,
-- 
/roberto
