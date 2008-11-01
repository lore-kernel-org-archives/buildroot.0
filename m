From: =?iso-8859-1?Q?Arnar_Mar_Sigur=F0sson?= <antab@valka.is>
Date: Sat, 1 Nov 2008 13:46:11 -0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
References: <20081031171723.6F149F8055@busybox.net>
	<200811011247.26080.markus.heidelberg@web.de>
Message-ID: <061E11D86E3DFF459604DF5B36F0805F1BA6D3@salka01.valka.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----Original Message-----
From: buildroot-bounces@uclibc.org on behalf of Markus Heidelberg
Sent: Sat 11/1/2008 11:47 AM
To: buildroot at uclibc.org
Cc: antab at uclibc.org
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
 
> Just some comments:

>> +config BR2_PACKAGE_QTOPIA4_GFX_MULTISCREEN
>> +	bool "multiscreen"
>> +	default y

> I don't know what the multiscreen driver is about, sounds like multiple
> physical screens. Is this a common setup that you default to y here?

Multiscreen is for using more then one output driver yes, so you can use linuxfb and VNC at the same time (what i'm doing). Probably should have it default no.

>> +config BR2_PACKAGE_QTOPIA4_MOUSE_VR41XX
>> +	bool "vxr41xx"

> vr41xx
Ah, damn typos;)

>> +	default n
> is not necessary in all the options
Is "default n" the default? Was not sure because i have seen other packages use "default n".

>> Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
>> +### Mouse drivers

> MOUSE_QVFB is missing here.
Good catch, i added all the drivers listed in configure -help, but not using all of them so i cant test all. Still need to add the kbd driver list, will do that later on.


> I could also make a patch, but I wanted to clarify the multiscreen thing
> first.
Patches are welcome

> Markus

Arnar Mar Sig
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081101/78254894/attachment.htm 
