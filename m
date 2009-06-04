From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Jun 2009 19:12:03 +0000 (UTC)
Subject: [Buildroot] [Bug 373] Support for building gstreamer without libxml
In-Reply-To: <bug-373-163@https.bugs.busybox.net/>
References: <bug-373-163@https.bugs.busybox.net/>
Message-ID: <20090604191203.5AA5677835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=373





--- Comment #3 from Markus Heidelberg <markus.heidelberg@web.de>  2009-06-04 19:12:02 UTC ---
It seems to be more common to simply use something like
BR2_PACKAGE_GSTREAMER_XML instead of BR2_PACKAGE_GSTREAMER_WITH_XML, i.e.
without the "_WITH".

You shouldn't introduce a new variable GSTREAMER_XML_DEP, but do
GSTREAMER_DEPENDENCIES += libxml2
similar to GSTREAMER_CONF_OPT +=
Having libxml2 behind host-pkgconfig doesn't matter.

In gst-plugins-good 


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
