From: Damien Borie <dbe@terawatt.fr>
Date: Tue, 23 Mar 2010 17:04:36 +0100
Subject: [Buildroot] Xorg configuration for XGI chip
In-Reply-To: <4BA3AAC2.9050400@gmail.com>
References: <4BA3A72B.3010009@terawatt.fr> <4BA3AAC2.9050400@gmail.com>
Message-ID: <4BA8E694.3080809@terawatt.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

I tried with latest snapshot. I still have problems to launch a X server.
With vesa and fbdev X drivers, it's OK, I can launch X server but only 
with depth 8, and resolution 800x600 for vesa and 600x480 for fbdev 
(framebuffer limit?). The problem is that I need depth 16 and 1024x600 
resolution.

With XGi driver built in Buildroot, I got an error :
"LoadModule: Module xgi does not have a xgiModuleData data object."
I don't know how to correct that, I think it's the result of a version 
compatibility problem.

With XGIz driver, download from XGI website, I got another error :
"dlopen: /usr/lib/xorg/modules/drivers/xgiz_drv.so: undefined symbol: 
resVgaMemShared"
Here again I think it's a problem of version. However I tried with all 
versions of this driver I found.

With SIS driver built in Buildroot, everything seems ok, no errors, but 
I only get a black screen. I tried a lot of options of the driver which 
seems to be useful but with no results.
I don't know how to resolve this problem. I need a working displaying in 
1024x600x16 mode but this chip doesn't seems to be very used with Linux.

So if somebody has the begin of an idea to solve this, I accept everything.

Thanks
Damien.

Paulius Zaleckas a ?crit :
> On 03/19/2010 06:32 PM, Damien Borie wrote:
>> Hi.
>>
>> I have to configure my Xorg X server to use a XGI Volari z9s chip. I'm
>> not very familiar with this and all I tried for now only make a black
>> screen.
>> I tried to use XGI driver from Buildroot, SIS driver from Buildroot, and
>> tried to install XGIZ driver downloaded from XGI website, but it's not
>> working.
>> I think I must insist with one of these drivers but I don't know which
>> one really works.
>
> [...]
>
>> The errors don't seems to be important as I don't use 3D and OpenGL.
>
> I get similar errors with Intel GPU and it works OK.
>
>> If someone has already work on this chip XGI z9s, which driver must be
>> used and how to configure it?
>
> I have almost no experience with XGI... But can you try latest buildroot
> from git or just download daily snapshot. There was massive X11 update.
>
>> Thanks,
>> Damien.
>
>
