From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 22 Sep 2007 23:43:54 +0200
Subject: [Buildroot] buildroot with ipkg
In-Reply-To: <1190496532.46f58914948c8@imp.free.fr>
References: <46EED912.2070902@free.fr> <20070917201401.GA28671@codepoet.org>
	<46EEEEE2.7060705@free.fr> <20070919064200.GA29317@zelow.no>
	<20070919192740.GC817@aon.at> <20070919205603.GA16408@zelow.no>
	<20070919215043.GX20058@aon.at> <46F2E33A.1070307@free.fr>
	<20070920213724.GA18637@zelow.no>
	<1190496532.46f58914948c8@imp.free.fr>
Message-ID: <20070922214354.GB20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 22, 2007 at 11:28:52PM +0200, julien.boibessot at free.fr wrote:
>Selon Thomas Lundquist <lists@zelow.no>:
>
>>
>> Why bother then? if all that will be done is putting it where everything
>> is today? Then it's no need to make packages at all.
>>
>
>With the "OpenWrt" method you have:
>* the packages (.ipkg) built for all the Buildroot software you selected with
>menuconfig
>* AND a rootfs with all these packages pre-installed (ready to test your
>configuration)
>
>After that you can upload your packages to your (web)server and share/use them,
>or directly flash the rootfs.
>What I was pointing in my email is that you probably don't need to add your
>"<m>" entry in Buildroot menuconfig. Your option to choose the package type
>should be
>enough: if the user choose to build packages, then you can build them for all
>the selected software.
>
>>
>> This is where I lost it. it's up to the end user to do this step. This
>> is why I do autonomous packages.
>>
>
>Sorry, I probably failed to explain my thoughts clearly...
>Why not build all software as packages when the user want it and as "builtin" in
>the other case ?

Yes, i'd prefer that, too, fwiw.
config BR2_TARGET_PKGFMT_IPKG
	help
	  build ipkg packages
config BR2_TARGET_ROOTFS_IPKG
	select BR2_TARGET_PKGFMT_IPKG
	help
	  Populate the rootfs with the ipkgs built earlier or the like.

Creating ipkg doesn't have to imply that you want to "waste" space for
the archive files (or however the equivalent of /var/lib/ipkg is
called).
>>
>> Feel free to to this and I'd be happy if there was a patch to choose
>> this method but no way am I going to make this the only one. The builder
>> should be able to choose what to put where.
>>
>
>Don't forget package dependencies...
>
>If you need help to integrate ipkg, I have already some modifications of
>Buildroot to share with you, before publishing them.
