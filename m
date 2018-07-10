From: Fame Castle <famecastle@gmail.com>
Date: Tue, 10 Jul 2018 13:05:16 +0200
Subject: [Buildroot] Guide for installing Chromium using patch sets
Message-ID: <CAD0+TpAc6473JO3H24CLwxUwc0WXZ5n8es1xJctnyhUEESrwWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to install chromium to my buildroot target using Joseph Kogut's
patch sets at
https://patchwork.ozlabs.org/project/buildroot/list/?series=51418. I
already had to figure out that I had to apply the patches from bottom to
top. But then, I was able to patch all the files successfully using `curl
"{path to the individual patch's mbox}" | git apply --whitespace=fix` .

I did a clean make and came across the following problem reported during
chromium configuration:

*> /home/buildroot/output/build/chromium-67.0.3396.79/printing/cups_config_helper.py
*>* --api-version
*>* Returned 1.
*>* stderr:
*>>* Traceback (most recent call last):
*>*   File
*>* "/home/buildroot/output/build/chromium-67.0.3396.79/printing/cups_config_helper.py",
*>* line 106, in <module>
*>*     sys.exit(main())
*>*   File
*>* "/home/buildroot/output/build/chromium-67.0.3396.79/printing/cups_config_helper.py",
*>* line 76, in main
*>*     subprocess.call([cups_config, '--api-version'])
*>*   File
*>* "/home/buildroot/output/host/lib/python2.7/subprocess.py",
*>* line 168, in call
*>*     return Popen(*popenargs, **kwargs).wait()
*>*   File
*>* "/home/buildroot/output/host/lib/python2.7/subprocess.py",
*>* line 390, in __init__
*>*     errread, errwrite)
*>*   File
*>* "/home/buildroot/output/host/lib/python2.7/subprocess.py",
*>* line 1025, in _execute_child
*>*     raise child_exception
*>* OSError: [Errno 2] No such file or directory
*>>* See //BUILD.gn:141:7: which caused the file to be included.
*>*       "//printing:printing_unittests",
*>*       ^------------------------------
*>* package/pkg-generic.mk:213 <http://pkg-generic.mk:213>: recipe for target*

It seems that cups_config_helper.py can't find a cups-config binary. You
replied to a similar problem here "
http://lists.busybox.net/pipermail/buildroot/2018-June/223810.html" in
which you speak of a v4 patch set, where this problem should be fixed. But
the latest patch set is v5. I am confused and don't understand which
patches I have to apply to make the build work. Furthermore, the patch
series at https://patchwork.ozlabs.org/project/buildroot/list/?series=51418
only contains patch 3/6 to 6/6 . What about the missing 2 patches?

I am using the latest buildroot cloned from the git repository's master
branch. I think that I will start a new clean project with the latest
stable buildroot version. A complete guide of how to compile chromium for
buildroot, including all neccessary patches, would be very helpful.

Thank you in advance.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180710/f631f6a4/attachment.html>
