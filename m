From: daggs <daggs@gmx.com>
Date: Fri, 21 Jul 2017 21:42:50 +0200
Subject: [Buildroot] img layout
In-Reply-To: <87r2x9pytc.fsf@dell.be.48ers.dk>
References: <trinity-526790e5-6239-4ac3-8df7-331d1a974560-1500619716190@3capp-mailcom-bs08>
 <20170721092626.57bf9db2@windsurf>
 <trinity-6a261bc1-46e9-4b2a-9e53-ec32e5d148b0-1500628795781@3capp-mailcom-bs09>
 <87vammoyqg.fsf@dell.be.48ers.dk>
 <trinity-87e7b58a-c039-4b11-8d40-18e2768a46c0-1500634784758@3capp-mailcom-bs02>
 <87r2x9pytc.fsf@dell.be.48ers.dk>
Message-ID: <trinity-7123c9ba-e38a-437e-9401-408b541f3e4d-1500666170296@3capp-mailcom-bs11>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Peter,

> Sent: Friday, July 21, 2017 at 6:57 PM
> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: daggs <daggs@gmx.com>
> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, buildroot at buildroot.org
> Subject: Re: [Buildroot] img layout
>
> >>>>> "daggs" == daggs  <daggs@gmx.com> writes:
> 
>  >> That looks very similar to the logic we already have in
>  >> board/hardkernel/odroid2c2/post-image.sh, isn't that working for you?
>  >> 
>  >> -- 
>  >> Bye, Peter Korsgaard
> 
>  > the original script won't work because it doesn't needs to address the signed bins because they are included.
>  > it uses a uboot 2005 based git fork that already includes it. without
>  > adding the signed bins, the system will not boot.
> 
> Ehh, ok - That I get, but the lines you pasted before are pretty similar to what
> we're already doing.
> 
> Looking at board/amlogic/odroid-c2/README in u-boot it looks like we
> need to package the hardkernel host utilities and binary ATF builds - Or
> perhaps we can use Andreas' meson-tools for (some of) the tasks:
> 
> https://github.com/afaerber/meson-tools
> 
> And then postprocess u-boot.bin with them and add it to the sdcard.img
> like we do today.
> 

my current implementation checks out the hk uboot repo and prepares it in the post install stage.
the offsets are known now (asked at their forums). first I'll get it to work, then the fixes will come.

Dagg.
