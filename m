From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Apr 2015 10:04:02 +0200
Subject: [Buildroot] [PATCH 1/1] jamvm: add depends on toolchain
	w/threads
In-Reply-To: <CANQCQpau5G=NqiHgmONpYH+CTF4Uv_BrFaVZdiBnSAj33y=Wog@mail.gmail.com>
 (Matthew Weber's message of "Wed, 1 Apr 2015 20:28:42 -0500")
References: <1427385280-63133-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20150401234340.1717eaf2@free-electrons.com>
 <871tk3r03i.fsf@dell.be.48ers.dk>
 <20150401235934.58eded2d@free-electrons.com>
 <CANQCQpau5G=NqiHgmONpYH+CTF4Uv_BrFaVZdiBnSAj33y=Wog@mail.gmail.com>
Message-ID: <87sicjot1p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

Hi,

>>> Hmm, that indeed doesn't sound right. I think the jamvm select should be
 >>> dropped from classpath.
 >> 
 >> There's no jamvm select in classpath, it's a 'depends on':
 >> 
 >> config BR2_PACKAGE_JAMVM
 >> bool "jamvm"
 >> select BR2_PACKAGE_CLASSPATH
 >> 
 >> config BR2_PACKAGE_CLASSPATH
 >> bool "classpath"
 >> depends on BR2_PACKAGE_JAMVM

 > Looking at http://www.gnu.org/software/classpath/stories.html#jvm it
 > looks like the jamvm "select" is correct but the classpath "depends"
 > should be removed.  (my interpretation of this is...) classpath is
 > just a library used by various JVMs so if another JVM was added to BR
 > we'd have to remove that depends anyway at that point and make that
 > JVM also do a select of classpath?

That's my understanding as well.

-- 
Venlig hilsen,
Peter Korsgaard 
