From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Apr 2015 23:15:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: fix nios2 detection
In-Reply-To: <1428005152-32735-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Thu, 2 Apr 2015 22:05:52 +0200")
References: <1428005152-32735-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87y4mansec.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Apache treats nios2 as OS/2 which is wrong.
 > Fixes
 > http://autobuild.buildroot.net/results/27c/27c5848a344c7e16feefcbd3773b50a78d6e63f0/
 > http://autobuild.buildroot.net/results/d8c/d8cf103033c63e79ed2db0b600f120f6fcb5b5e9/
 > http://autobuild.buildroot.net/results/1de/1dec866cf9a5f731a9ed93dff5b8b98001863635/
 > http://autobuild.buildroot.net/results/776/776be8ef579e3444123d8183dca1062ece656436/
 > http://autobuild.buildroot.net/results/5d2/5d21ac2d8f008d984d6f8b359ebb0e2482545683/
 > http://autobuild.buildroot.net/results/87f/87f25b20f63eebf7f75e35064bad79e3d383e7a8/
 > http://autobuild.buildroot.net/results/1b7/1b75f52c70af7880d523185565b7aaf59d9f9b3e/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/apache/0002-nios2_is_not_os2.patch |   18 ++++++++++++++++++
 >  1 file changed, 18 insertions(+)
 >  create mode 100644 package/apache/0002-nios2_is_not_os2.patch

 > diff --git a/package/apache/0002-nios2_is_not_os2.patch b/package/apache/0002-nios2_is_not_os2.patch
 > new file mode 100644
 > index 0000000..20f60fa
 > --- /dev/null
 > +++ b/package/apache/0002-nios2_is_not_os2.patch
 > @@ -0,0 +1,18 @@
 > +Fix nios2 detection.
 > +
 > +Apache treats nios2 as OS/2.
 > +
 > +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > +
 > +diff -uNr httpd-2.4.12.org/configure.in httpd-2.4.12/configure.in
 > +--- httpd-2.4.12.org/configure.in	2015-01-22 18:33:07.000000000 +0100
 > ++++ httpd-2.4.12/configure.in	2015-04-02 22:01:32.851102219 +0200
 > +@@ -268,7 +268,7 @@
 > + AC_MSG_NOTICE([])
 > + 
 > + case $host in
 > +-  *os2*)
 > ++  *os_2*)

Is os_2 really the correct host name for OS/2? Have you brought this up
with upstream?

-- 
Bye, Peter Korsgaard
