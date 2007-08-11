From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 11 Aug 2007 23:30:14 +0300
Subject: [Buildroot] AUTOTARGETS is not working correctly when applying
 x11r7 patches, was (  X11R7 packages available )
In-Reply-To: <20070810185512.GA4186@codepoet.org>
References: <f0528b5b0707040129j262b9e24i774fd06d8d579a2a@mail.gmail.com>
	<20070810185512.GA4186@codepoet.org>
Message-ID: <46BE1C56.60508@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Any feedback is welcome... once this is tested I think it would be a good
>> idea to add the whole thing to Buildroot.
> 
> Fantastic.  I've merged your patches with very minor changes.
> It doesnt quite build for me, but hopefully we can get that
> sorted out soon.  This was clearly a huge undertaking and a
> true labor of love.  Thanks!
> 

Hello,

$(eval $(call AUTOTARGETS,xlib_liblbxutil)) is not working correctly when applying patches:

 >>> xlib_liblbxutil 1.0.1 Patching

(if test -d package/xlib_liblbxutil ; then \
   if test "" ; then \
     toolchain/patch-kernel.sh /root/buildroot/build_arm/xlib_liblbxutil-1.0.1 package/xlib_liblbxutil xlib_liblbxutil-1.0.1\*.patch || exit 1 ; \
   else \
     toolchain/patch-kernel.sh /root/buildroot/build_arm/xlib_liblbxutil-1.0.1 package/xlib_liblbxutil xlib_liblbxutil\*.patch || exit 1 ; \
     if test -d package/xlib_liblbxutil/xlib_liblbxutil-1.0.1 ; then \
       toolchain/patch-kernel.sh /root/buildroot/build_arm/xlib_liblbxutil-1.0.1 package/xlib_liblbxutil/xlib_liblbxutil-1.0.1 \*.patch || exit 1 ; \
     fi; \
   fi; \
fi)

should be package/x11r7/xlib_liblbxutil

Best regards,
Ivan
