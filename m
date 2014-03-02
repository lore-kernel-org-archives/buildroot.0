From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 2 Mar 2014 14:24:06 +0200
Subject: [Buildroot] Segmentation fault while trying to remote debug
 with GDB and GDBServer
In-Reply-To: <29f88dd2071c483bb7102687088ac6b3@DBXPR07MB142.eurprd07.prod.outlook.com>
References: <51ef4c3ec6f84eab802c23a14ecb48ae@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302070650.GE3874@tarshish>
 <24eee2c96f804b55ae7767734d5a4f6e@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302091205.GF3874@tarshish>
 <29f88dd2071c483bb7102687088ac6b3@DBXPR07MB142.eurprd07.prod.outlook.com>
Message-ID: <20140302122406.GJ3874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Oded,

On Sun, Mar 02, 2014 at 12:06:35PM +0000, Oded Hanson wrote:
> OK... After 1 hour of rebuilding my system back with the internal GLIBC 
> toolchain I can say...
> 
> Thanks !!! :)

Good to hear. I just want to note again that for correct GDB operation, 
setting sysroot is needed for external toolchains as well.

baruch

> Its working. Now I just need to see how to make the eclipse plugin run the 
> set sysroot command 
> 
> -----Original Message-----
> From: Baruch Siach [mailto:baruch at tkos.co.il] 
> Sent: Sunday, March 02, 2014 11:12 AM
> To: Oded Hanson
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] Segmentation fault while trying to remote debug with GDB and GDBServer
> 
> On Sun, Mar 02, 2014 at 07:27:36AM +0000, Oded Hanson wrote:
> > I missed your answer about the GDB.
> > 
> > How can I force GDB to use my cross compiler libs instead?
> > 
> > The logs you see are from my manually using GDB,  which indeed might 
> > have not been configured to use the cross compiler libs,  however,  I 
> > get the same problem when using the debugger from eclipse,  using the 
> > buildroot plugin , which does indeed use the libraries from the cross 
> > compiler (at least it should,  how can I verify this? )
> 
> I'm not familiar with the Eclipse plugin so I can't comment on that. As to 
> command line invocation of GDB you can change the sysroot of GDB as I said 
> in my original response with:
> 
> (gdb) set sysroot /home/oded/Buildroot/buildroot-2013.11/output/staging
> 
> GDB uses sysroot to locate your target dynamic linker and libraries.
> 
> baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
