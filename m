From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 04 Feb 2017 17:12:56 +0100
Subject: [Buildroot] [PATCH 05/11] libevent: bump to version 2.1.8
In-Reply-To: <20170203202959.18916-5-aduskett@codeblue.com> (Adam Duskett's
 message of "Fri, 3 Feb 2017 15:29:53 -0500")
References: <20170203202959.18916-1-aduskett@codeblue.com>
 <20170203202959.18916-5-aduskett@codeblue.com>
Message-ID: <87tw8ax7cn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > I also modified the Disable-building-test-programs.patch to work
 > with the newer Makefile.

 > Signed-off-by: Adam Duskett <aduskett@codeblue.com>
 > ---
 >  package/libevent/0001-Disable-building-test-programs.patch | 11 +++++------
 >  package/libevent/libevent.hash                             |  6 +++---
 >  package/libevent/libevent.mk                               |  2 +-
 >  3 files changed, 9 insertions(+), 10 deletions(-)

 > diff --git a/package/libevent/0001-Disable-building-test-programs.patch b/package/libevent/0001-Disable-building-test-programs.patch
 > index eb1acfd..80901de 100644
 > --- a/package/libevent/0001-Disable-building-test-programs.patch
 > +++ b/package/libevent/0001-Disable-building-test-programs.patch
 > @@ -16,12 +16,11 @@ diff --git a/Makefile.am b/Makefile.am
 >  index 42879a3..dc90359 100644
 >  --- a/Makefile.am
 >  +++ b/Makefile.am
 > -@@ -126,7 +126,7 @@ else
 > - noinst_LTLIBRARIES =  $(LIBEVENT_LIBS_LA)
 > - endif
 > - 
 > --SUBDIRS = . include sample test
 > -+SUBDIRS = . include sample
 > +@@ -144,7 +144,6 @@
 > + BUILT_SOURCES =
 > + include include/include.am
 > + include sample/include.am
 > +-include test/include.am

You're significantly reworking this patch, so the patch description should
be updated and your signed-off-by added. As you already signed-off-by
your entire change and the patch is trivial so I took the liberty to add
it myself.

Let me know if you have any problems with that.

-- 
Bye, Peter Korsgaard
