From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Sep 2011 22:41:52 +0200
Subject: [Buildroot] [PATCH] taglib: bump to 1.7
In-Reply-To: <1316982696.9373.3.camel@bender> (Sven Neumann's message of "Sun, 
 25 Sep 2011 22:31:36 +0200")
References: <1316767809-5856-1-git-send-email-s.neumann@raumfeld.com>
 <87d3eozcib.fsf@macbook.be.48ers.dk> <1316982696.9373.3.camel@bender>
Message-ID: <87vcsgxskv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 >> This is wrong. The existing install support was fine. With this you
 >> broke BR2_HAVE_DEVFILES / BR2_HAVE_DOCUMENTATION / BR2_PREFER_STATIC_LIB
 >> configurations.

 Sven> If I remember correctly I tried the existing install support first and
 Sven> we ended up with all the development files (taglib header files and
 Sven> such) on the target. But I'll check this again.

You'll indeed get all headers installed, but the target-finalize step
(which runs just before the file systems are created) will remove them
unless HAVE_DEVFILES / HAVE_DOCUMENTATION are enabled.

-- 
Bye, Peter Korsgaard
