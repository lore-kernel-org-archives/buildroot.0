From: Rob Landley <rob@landley.net>
Date: Mon, 08 Jul 2013 02:33:53 -0500
Subject: [Buildroot] savedefconfig for busybox?
In-Reply-To: <87d2qui2au.fsf@dell.be.48ers.dk> (from jacmet@uclibc.org on
 Sun Jul  7 14:43:21 2013)
References: <20130707132034.GA10748@zuhnb712> <87d2qui2au.fsf@dell.be.48ers.dk>
Message-ID: <1373268833.27613.16@driftwood>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/07/2013 02:43:21 PM, Peter Korsgaard wrote:
> >>>>> "Woody" == Woody Wu <narkewoody@gmail.com> writes:
> 
>  Woody> Hi,
>  Woody> Is there something like 'make busybox-savedefconfig'?
>  Woody> Or, otherwise, how to save busybox config changes?
> 
> Do you mean a minimal .config (a defconfig) file? Upstream busybox
> unfortunately doesn't support that.
> 
> If you just mean how to save your full busybox .config after you  
> changed
> it with 'make busybox-menuconfig', then you can just copy
> out/build/busybox-*/.config to somewhere
> (board/vendor/product/busybox.config is a common location) and
> then change your buildroot BR2_PACKAGE_BUSYBOX_CONFIG option to point  
> to
> it.
> 
> Also see section 3.3.2 and 3.3.3 in the user manual:
> 
> http://buildroot.net/downloads/manual/manual.html#busybox-custom

On a side note, you might be interested in:

   http://landley.net/aboriginal/FAQ.html#dev_miniconfig

For busybox, I use:

   http://landley.net/hg/aboriginal/file/tip/sources/baseconfig-busybox

Rob
