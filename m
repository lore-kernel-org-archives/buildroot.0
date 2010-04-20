From: Andrew Porritt <aporritt@gogo-robot.com>
Date: Tue, 20 Apr 2010 13:52:03 +0100
Subject: [Buildroot] question on config.cache
In-Reply-To: <025e01cae083$b5eebca0$21cc35e0$@com>
References: <mailman.0.1271765550.25465.buildroot@busybox.net>
	<025e01cae083$b5eebca0$21cc35e0$@com>
Message-ID: <4BCDA373.6040300@gogo-robot.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've attached my package that I'm using to build mono with buildroot. It 
copies the config.cache file to the build folder and uses that when 
configuring mono. There are also a couple of patches in there which you 
may or may not need. It builds mono without the managed code. At the 
moment you need to do a full build of mono on the host and then copy the 
assemblies from the full build to the one built with buildroot. I'm not 
sure if building the managed code will work from within buildroot, but 
you could try taking out the --disable-mcs-build option from the .mk 
file and see what happens. I based it on this page on the mono site: 
http://www.mono-project.com/Mono:ARM

Hope this helps.

On 20/04/2010 13:19, Ben Kloosterman wrote:
> Im trying to crosscompile mono on i386 + uclib (without mmu)  and have
> created a package and after a few things I fixed I now get stuck on
>
> "checking for preceding underscore symbols"    then the cannot run prog
> message.
>
> I found you should/can set the mono_cv_sizeof_sunpath  and mono_cv_uscore
> config cache options but how exactly do I do this in buildroot  ?  I tried
> some echos in the mono.mk file but they were just ignored.  Im using a basic
> autoconfig mk file.
>
> Regards,
>
> Ben Kloosterman
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>    
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-package-mono-2.6.3.tar.bz2
Type: application/octet-stream
Size: 2746 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100420/3d5909e0/attachment.obj>
