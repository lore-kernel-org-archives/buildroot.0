From: Eric Seifert <eric.seifert@cyaninc.com>
Date: Thu, 6 Sep 2012 09:22:12 -0700
Subject: [Buildroot] python shebang pointing to host python
Message-ID: <CALoHCLPnv3GyBmiDEd5PvBp2o+O2gJSfdtbLFiad9FwkjVDLEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I am trying to get some python modules installed with buildroot
2012.08. The module themselves seem to get built and installed correctly,
my problem is that some of them install executable scripts, and these
scripts have shebangs at the top that point to the host python instead of
the target /usr/bin/python.

I've noticed this, not just with the modules I built, but also with the
included setuptools module that is included. It installs the easy_install
script, and it does not run by default unless you update the shebang.

Is there a way to tell the module when installing which python to point to?

On a separate and unrelated note, even after I fix the shebang in
easy_install, I get: ImportError: No module named pkg_resources


Thanks,
Eric Seifert
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120906/ed70a5df/attachment.html>
