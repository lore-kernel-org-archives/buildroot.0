From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 24 May 2014 07:57:27 +0200
Subject: [Buildroot] Fwd:  root password and dhcp
In-Reply-To: <4B870E1C-7161-4A44-8B57-243F6845BB3C@gmail.com>
References: <83E0831E-A969-40BA-9022-B9024D5AB91C@gmail.com>
 <4B870E1C-7161-4A44-8B57-243F6845BB3C@gmail.com>
Message-ID: <082c35fb-f075-4ade-8b37-5b145389005d@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cem akpolat <akpolatcem@gmail.com> schreef:
>
>>> Hi Cem,
>>> 
>>> On Fri, May 23, 2014 at 4:10 PM, cem akpolat <akpolatcem@gmail.com> wrote:
>>>> Dear all,
>>>> 
>>>> I have compiled a new file system via buildroot and modified the .cpio
>>>> according to my requirements, then repack it and run with the linux kernel.
>>>> 
>>>> My first question how can I access via ssh without root password? For
>>>> instance in openwrt file system, it is possible to access firstly through
>>>> telnet, if required, you can assign a password after the telnet connection.
>>>> Does buildroot provide the same functionality?
>>> 
>>> You can either set the root password in the buildroot configuration
>>> (but it will be stored in the config file in plaintext, so for a
>>> non-personal project that may not be ok) or you can update the
>>> /etc/shadow file from a post-build script, see the presentation
>>> http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf slide
>>> 25.
>> This is exactly the point that I want to know. There are some scripts that I want to add to the file system. It seems that I have to add also them in the system/skeleton and 
>> define the required rule in post-build.sh script. This is the whole thing that I understood from the slide :)

I should have realized that the slides are a bit outdated. In the mean time, in addition to post build scripts, we directly support a rootfs overlay, see config BR2_ROOTFS_OVERLAYS, also explained in the manual...

Best regards,
Thomas
