From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Mar 2015 23:38:23 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/softether: Fix iconv-related
	compile error
In-Reply-To: <XnsA45FBD041150DberndkuhlsPkbjNfxxIA@bernd-kuhls.de> (Bernd
 Kuhls's message of "Mon, 16 Mar 2015 18:34:52 +0100")
References: <1426408159-24817-1-git-send-email-bernd.kuhls@t-online.de>
 <20150315125324.39a11265@free-electrons.com>
 <874mplg9bz.fsf@dell.be.48ers.dk>
 <20150316091235.7c77634c@free-electrons.com>
 <XnsA45FBD041150DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <87iodzl068.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
 > @public.gmane.org> wrote in news:20150316091235.7c77634c at free-electrons.com:

 >> Yann suggested it might be a dash vs. bash issue where bash would
 >> accept multiple LIBS += on the command line, but not dash. But I
 >> changed /bin/sh to point to /bin/dash on my system, and I still
 >> couldn't reproduce the problem.

 > Hi,

 > FYI

 > $ dpkg -l | grep dash
 > ii  dash        0.5.7-3              amd64        POSIX-compliant shell

 > $ ls -la /bin/sh
 > lrwxrwxrwx 1 root root 4 Mr  1  2012 /bin/sh -> dash

My setup is almost the same, except:

dpkg -l dash | grep ii
ii  dash           0.5.7-4+b1   amd64        POSIX-compliant shell

So I don't think that is the reason.

-- 
Bye, Peter Korsgaard
