From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 May 2020 21:31:37 +0200
Subject: [Buildroot] Package configure script environment
In-Reply-To: <b0635a68-dae9-1e89-c352-1082e49990ad@FoxValley.net>
References: <b0635a68-dae9-1e89-c352-1082e49990ad@FoxValley.net>
Message-ID: <20200507213137.01a886c6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 7 May 2020 12:59:04 -0500
Paul C Diem <PCDiem@FoxValley.net> wrote:

> I'm trying to find how buildroot execute package configure scripts. 
> Specifically, I'm trying to build unbound. It build fine under buildroot 
> 2019.02 but I'm having trouble under 2020.02.1. The problem is that the 
> ubnound configure script looks for include files (such as ssl.h) in 
> directories such as /usr. It appears that from the configure script's 
> perspective, /usr is the the /usr of the system I'm building on. It 
> seems it should be the host /usr from sysroot. I assume a lot of 
> configure scripts look for the existence of files in include and 
> libraries directories and I would have thought buildroot chroot'ed into 
> the host filesystem root when it ran the package configure scripts. Can 
> someone explain in what environment the package configure scripts are 
> executed?

Why don't you use the "unbound" package that Buildroot has in
package/unbound/ ? It is already integrated, and therefore solves all
those cross-compilation issues for you.

Rule: if you're building something manually against Buildroot, you're
most likely wrong. You should be using an existing package, or create
your own package.

Hope this helps!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
