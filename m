From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 29 Sep 2007 00:47:15 +0300
Subject: [Buildroot] PATCH [2/2] update x11r7 packages to
 use	NAME_PREFIX when calling AUTOTARGETS
In-Reply-To: <20070928203734.GX20951@aon.at>
References: <46FD7109.6000500@promwad.com> <20070928203734.GX20951@aon.at>
Message-ID: <46FD7663.3010205@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Oh, and it would be more intuitive -- at least for me -- if you would
> prepend the DIR_PREFIX, as in 
> 
>> -$(eval $(call AUTOTARGETS,xdriver_xf86-video-via))
>> +$(eval $(call AUTOTARGETS,x11r7,xdriver_xf86-video-via))
> 
> , please.

Hm, 3rd parameter is treated as optional in AUTOTARGETS.
Can we force for other packages not x11r7 ones but which use AUTOTARGETS to use the following syntax:

$(eval $(call AUTOTARGETS,,mypackage))            - if package/mypackage

and

$(eval $(call AUTOTARGETS,x11r7,mypackage))            - if package/x11r7/mypackage

?

BR,
Ivan

-- 

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
