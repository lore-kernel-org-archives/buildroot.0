From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Nov 2014 08:57:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/network-manager: NM needs
 ISC-DHCPC or DHCPCD
In-Reply-To: <54757952.4010007@gmail.com>
References: <1416983821-2729-1-git-send-email-nroach44@gmail.com>
 <20141126064539.GM2374@sapphire.tkos.co.il>
 <54757952.4010007@gmail.com>
Message-ID: <20141126065754.GN2374@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nathaniel,

On Wed, Nov 26, 2014 at 02:55:14PM +0800, Nathaniel Roach wrote:
> On 26/11/14 14:45, Baruch Siach wrote:
> > On Wed, Nov 26, 2014 at 02:37:01PM +0800, Nathaniel Roach wrote:
> >>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> >> +	depends on BR2_PACKAGE_DHCP_CLIENT || BR2_PACKAGE_DHCPCD
> > 
> > We usually use 'select' for this kind of dependencies. Something like 
> > (untested):
> > 
> > 	select BR2_PACKAGE_DHCPCD if !BR2_PACKAGE_DHCP_CLIENT
> 
> Ah, okay. I was wondering about that, thanks.
> 
> I'll leave this version up for now as my other questions are still
> valid. Furthermore, is there a preference as to DHCPCD vs ISC?

I think we should default to the more lightweight one. I guess it's dhcpcd in 
this case.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
