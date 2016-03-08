From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 8 Mar 2016 09:01:26 -0800
Subject: [Buildroot] [Bug 8771] make savedefconfig modifies sources
In-Reply-To: <20160308090651.293fd95e@free-electrons.com>
References: <bug-8771-163@https.bugs.busybox.net/>
 <bug-8771-163-YmX2Br27g5@https.bugs.busybox.net/>
 <56DE1142.6080201@mind.be>
 <20160308090651.293fd95e@free-electrons.com>
Message-ID: <CAJJ6jxsZrveK6ziC0pPng+aTSuB4z=puUdMv5jjViM3aLfFNdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 8, 2016 at 12:06 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>  - It deviates from what the kernel does, which is a bit in violation
>    of our principle "our configuration system is like the kernel"
>
>  - It modifies version-controlled source code.
>
I use BR2_EXTERNAL and my custom stuff is in a git tree. So modifying
my external config is good. I can see what changed using git difftool,
revert it easily or commit an improved config.

It may deviate from a kernel savedefconfig does, but in buildroot the
kernel linux-savedefconfig does exactly the same thing as buildroot
savedefconfig. (if you configure the buildroot kernel for an external
config.)

Personally I find the maintenance of output/.br_external as more
bizarre and confusing. It does allow me to not have to remember to set
BR2_EXTERNAL when make is invoked, but it gets cleaned on make clean.
So using an external tree requires either a shell variable or using my
unreliable wet-ware memory.

But what we have works and changing this kind of stuff breaks user
habits, which cannot be easily corrected by documentation.

Regards, Steve
