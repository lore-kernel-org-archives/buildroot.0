From: glscantlen <glscantlen@gmail.com>
Date: Fri, 2 Oct 2015 10:14:31 -0700 (PDT)
Subject: [Buildroot] [Bug 8206] mplayer uses host xorg development files
In-Reply-To: <55A13972.2060908@mind.be>
References: <bug-8206-163@https.bugs.busybox.net/>
 <20150707210059.917A78015E@busybox.osuosl.org>
 <1436622071664-105281.post@n4.nabble.com> <55A12A5E.4010900@mind.be>
 <1436625379066-105305.post@n4.nabble.com> <55A1359C.5020109@mind.be>
 <20150711173913.32fbc8a7@free-electrons.com> <55A13972.2060908@mind.be>
Message-ID: <1443806071553-113718.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I realize this is an old thread, but it appears the issue was not resolved
and I have a solution that works for my defconfig on both 2015.05 & .08.

The most recent version I have tested is snapshot 2015.08 from
git.buildroot.net
on Sept.30. That version has exhibited the same issue as previous versions
noted in this thread "mplayer uses host xorg development files"

The solution I am using is described here:
    - Fix a bug in the mplayer's .mk file. Add Buildroot's path
      for staging to mplayer's configuration, ~ line 259
       $ nano -w package/mplayer/mplayer.mk
          --extra-cflags="$(MPLAYER_CFLAGS) -I$(STAGING_DIR)/usr/include" \
          --extra-ldflags="$(MPLAYER_LDFLAGS) -L$(STAGING_DIR)/usr/lib" \




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Bug-8206-New-mplayer-uses-host-xorg-development-files-tp104861p113718.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
