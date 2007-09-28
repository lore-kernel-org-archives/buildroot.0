From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Sep 2007 22:47:57 +0200
Subject: [Buildroot] PATCH [2/2] update x11r7 packages to
	use	NAME_PREFIX when calling AUTOTARGETS
In-Reply-To: <46FD7663.3010205@promwad.com>
References: <46FD7109.6000500@promwad.com> <20070928203734.GX20951@aon.at>
	<46FD7663.3010205@promwad.com>
Message-ID: <20070928204755.GZ20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 29, 2007 at 12:47:15AM +0300, Ivan Kuten wrote:
>
>> Oh, and it would be more intuitive -- at least for me -- if you would
>> prepend the DIR_PREFIX, as in 
>> 
>>> -$(eval $(call AUTOTARGETS,xdriver_xf86-video-via))
>>> +$(eval $(call AUTOTARGETS,x11r7,xdriver_xf86-video-via))
>> 
>> , please.
>
>Hm, 3rd parameter is treated as optional in AUTOTARGETS.
>Can we force for other packages not x11r7 ones but which use AUTOTARGETS to use the following syntax:
>
>$(eval $(call AUTOTARGETS,,mypackage))            - if package/mypackage
>
>and
>
>$(eval $(call AUTOTARGETS,x11r7,mypackage))            - if package/x11r7/mypackage

That is bypassed since we don't have "package/" in there, so the
DIR_PREFIX for non-x11 would be plain "package". See the mail i just
sent.
