From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 25 Aug 2015 08:53:04 +0000 (UTC)
Subject: [Buildroot] [Bug 8256] pointing to /usr/bin/objcopy old version
 (x86) instead of the generated one
In-Reply-To: <bug-8256-163@https.bugs.busybox.net/>
References: <bug-8256-163@https.bugs.busybox.net/>
Message-ID: <20150825085305.04A5081E0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8256

--- Comment #9 from CB <christophebricout@yahoo.fr> 2015-08-25 08:53:03 UTC ---
Thanks for your feedback.

I will execute the buildroot as requested and provide you with the config log.

In parallel, I launched buildroot using Virtual Box and CENTOS 7.
Buildroot is correcty working as the host 'objcopy' utility is using 
a compatible version allowing x86_64 binary.
It seem confirm your guess concerning 'objcopy' version differs between Host
and Target. This is my case under RedHat Linux 5 (eq Centos 5). This issue
doesn't exist under Centos 7. 


Thanks again.


(In reply to comment #8)
> (In reply to comment #2)
> 
> > Before launcing gmake, I have  now executed the following command
> > 
> > setenv PATH
> > "/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/x86_64-buildroot-linux-uclibc/bin:/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/bin:${PATH}"
> > set PATH = "/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/x86_64-buildroot-linux-uclibc/bin:/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/bin:${PATH}"
> 
> I don't know why you think it's a good idea to add the target binaries to your
> PATH. Don't do that.
> 
> The config.log of attachment 6136 [details] is useless. Could you re-run a clean build
> without hacking PATH, and then attach the full
> output/build/grub2-2.00/config.log please?
> 
> My conjecture is that grub2 is using the wrong objcopy somewhere in configure.
> Oh, indeed, now I see: we use HOST_CONFIGURE_OPTS, so it will have
> OBJCOPY=/usr/bin/objcopy explicitly. I guess we should override that with
> OBJCOPY=$(TARGET_OBJCOPY), but I'm not sure how that will affect other
> host,target combinations...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
