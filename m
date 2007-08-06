From: Brad House <brad@mainstreetsoftworks.com>
Date: Mon, 06 Aug 2007 11:10:55 -0400
Subject: [Buildroot] [patch] libxml2 fixes
Message-ID: <46B739FF.5020507@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are a few issues with libxml2.
  - It depends on BR2_USE_WCHAR (which in reality, it doesn't)
  - xml2-config exports the wrong paths
  - it tries to build everything, python modules, etc
  - libxml2.la is installed, which has a wrong path, causes issues
    when linking using libtool, just remove it.

Here's a patch to clean that up...


-Brad
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: libxml2-fixes.patch
Url: http://busybox.net/lists/buildroot/attachments/20070806/c8e1dbac/attachment.diff 
