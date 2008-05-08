From: Arnar Mar Sig <antab@valka.is>
Date: Thu, 8 May 2008 13:23:07 +0000
Subject: [Buildroot] make clean;make fails
In-Reply-To: <B44D4D5BF344094DABB900C4E0F6E353016EB1F1FE@srv02.nortechonline.net>
References: <B44D4D5BF344094DABB900C4E0F6E353016EB1F1FE@srv02.nortechonline.net>
Message-ID: <DF151FE7-5E4F-4604-9F3D-DDC5F48E2319@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On May 8, 2008, at 1:01 PM, Hodgson, Simon wrote:

> Hi There,
>
> I'm trying to remove some packages from my buildroot to free up some  
> diskspace.
>
> First, I noticed if I do 'make menuconfig' remove the packages then  
> 'make' they don't actually get removed from the rootfs disk image.
There is no standard deinstall/remove for packages in buildroot (that  
I know off), some packages have rules to remove them, but not all.

> So then I thought I'd try 'make clean', 'make' but it would appear  
> this doesn't put all the necessary stuff into project_build_arm/ 
> at91sam9260dfc/root/ (e.g. /usr/bin directory is missing, /etc/ 
> shadow file is missing amongst others)
>
> Is this is bug in the buildroot system, or something I'm doing wrong?
/etc/shadow and most /etc files are installed from the target_skelaton  
you are using, and that depends on the Device target you are building  
for.
/usr/bin is only created if needed by packages, so if it isin't there,  
no packages needed it.


Arnar Mar Sig
