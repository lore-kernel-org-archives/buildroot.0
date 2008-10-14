From: hartleys <hartleys@visionengravers.com>
Date: Tue, 14 Oct 2008 12:06:24 -0400
Subject: [Buildroot] docs/buildroot.html - how to add application
	software
In-Reply-To: <009501c92e14$0a06a100$6901a8c0@iguana3>
References: <009501c92e14$0a06a100$6901a8c0@iguana3>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909AEF15B@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, October 14, 2008 8:47 AM, John Schimandle wrote:
> I'm new to the buildroot community so first I'd like to
> introduce myself. I'm John Schimandle and I'm glad to be
> here and hopefully my 28 years of experience in the computer
> engineering field will be of some use to all of you. I'm
> excited to start using embedding linux on my embedded
> hardware platforms I design. My job is to design the
> hardware and then provide a base development platform for
> my clients to develop their software.

Hello and welcome!

> After a bit of struggling I have compiled, built and booted
> a target system for my at91sam9263ek development board. Now
> I would like to add some application software. I was reading
> the buildroot usage and documentation document at
> docs/buildroot.html specifically the section entitled
> "Extending Buildroot with more software". I followed the
> instructions and worked through my syntax errors on the
> files but could not get the new package to show up in
> menuconfig. After much searching I found a file named
> package/Config.in which controls the appearance of the
> package selections in menuconfig. After modifying this
> file with my new package I was able to see my new package
> in menuconfig. I went back and looked at docs/buildroot.html
> and could not find any mention of the package/Config.in file.
>
> I'm wondering if this is the expected behavior of the system.
> If so, I would like to submit a patch to buildroot.html to
> document the existence of the package/Config.in file and how
> to add your new package to it.
> 
> Let me know if this is how the menuconfig/package subsystem
> is supposed to work.
>
> If there is a better way to add application software to
> buildroot I'd like to hear about that as well.

I'm not an expert on this by any means, but...

I believe that is the how the menuconfig stuff is supposed to work. It
appears to use the same mechanism as the Linux kernel. If your package
directory is not "include"d somewhere in the various *.in files it will
not show up in the menuconfig.

For my use I actually "hijacked" the package/customize directory. The
Config.in in that directory is included by package/Config.in. By putting
all my junk in the customize directory I keep the remaining parts of
buildroot clean and it make it easier to update based on the current
svn.

Then if I have a package in the customize directory that appears useful
to the community I can move it into the package directory, update the
package/Config.in, and submit a patch for possible inclusion.

I'm not sure if that's the "best" way but it works for me...

Just my two cents...

Hartley
