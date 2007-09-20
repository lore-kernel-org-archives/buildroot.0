From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 20 Sep 2007 23:16:42 +0200
Subject: [Buildroot] buildroot with ipkg
In-Reply-To: <20070919215043.GX20058@aon.at>
References: <7fc538d30709170509s4898cc55keb14ebb718d30090@mail.gmail.com>	<46EED912.2070902@free.fr>
	<20070917201401.GA28671@codepoet.org>	<46EEEEE2.7060705@free.fr>
	<20070919064200.GA29317@zelow.no>	<20070919192740.GC817@aon.at>
	<20070919205603.GA16408@zelow.no> <20070919215043.GX20058@aon.at>
Message-ID: <46F2E33A.1070307@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer a ?crit :
> yeah. I'll reread the dropbear example tomorrow. Perhaps somebody else
> has other comments.
>
>   
Well I 'm not sure it's a good idea to let the user mix "builtin" and 
"packaged" software.
If he choose to use ipkg, or another method, then all the Buildroot 
utilities he wants to have in its rootfs should be packaged with the 
selected method and then installed in the TARGET_DIR, just before 
creating the (jffs2/ext2/...) rootfs image.
That's what they do in OpenWrt and I think it's a good idea:
* build the selected utility/package
* install it in a custom directory, instead of TARGET_DIR
* "ipkage" it from that directory
* install the generated "xxx.ipkg" in TARGET_DIR

That way your system is always aware of the installed packages even if 
you flash a complete rootfs (I'm speaking of the ipkg case which is the 
only one I have studied yet). After flashing, you can even removed 
packages directly from your target.

Regards,
Julien
