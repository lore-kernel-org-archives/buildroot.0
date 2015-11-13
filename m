From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2015 22:33:42 +0100
Subject: [Buildroot] [PATCH 2/2] configs/qemu: bump to the latest linux
	version
In-Reply-To: <56458387.60103@mind.be> (Arnout Vandecappelle's message of "Fri, 
 13 Nov 2015 07:30:31 +0100")
References: <1447151972-12086-1-git-send-email-gustavo@zacarias.com.ar>
 <1447151972-12086-2-git-send-email-gustavo@zacarias.com.ar>
 <20151112211421.GB21428@waldemar-brodkorb.de>
 <5645031D.5060405@zacarias.com.ar>
 <20151113052422.GD21428@waldemar-brodkorb.de> <56458387.60103@mind.be>
Message-ID: <87mvuhlh3d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  BTW, will non-ng uClibc still be broken? If so, how do we deal with that?

Perhaps we can backport the patch to the legacy 0.9.33 release as well?
From a quick look the code in socketcalls.c does look quite different
though :/

> External uClibc toolchains will still not have the fix...

No, but it is atleast only an issue if they have been built with >= 4.3
kernel headers and _WITHOUT_ this fix.

-- 
Bye, Peter Korsgaard
