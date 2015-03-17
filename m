From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 14:12:37 +0100
Subject: [Buildroot] [PATCH v2] package/sysdig: New package
In-Reply-To: <CA+TH9Vkmn68BhLSWiv7rgcfR7ZPq4uqYBHcCU7qUjHAHUWcCPg@mail.gmail.com>
References: <1426589808-568-1-git-send-email-angelo.compagnucci@gmail.com>
 <20150317112339.GM2415@tarshish>
 <CA+TH9VnhBOe+KSV+6nsgF_sUD9SX8WtfQpY2oxG_=5h-=nSniA@mail.gmail.com>
 <20150317114816.GN2415@tarshish>
 <CA+TH9Vkmn68BhLSWiv7rgcfR7ZPq4uqYBHcCU7qUjHAHUWcCPg@mail.gmail.com>
Message-ID: <20150317141237.10b2f0cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Tue, 17 Mar 2015 12:59:11 +0100, Angelo Compagnucci wrote:

> > You are right, I missed that. It's just that I'm used to see these comments
> > below the main 'config' section. Putting the comment above is also fine,
> > though. Don't forget to update this comment when adding indirect dependencies.
> 
> I think that if I use select, the dependencies of this package will
> explode. I think I can use select for simple, non problematic
> packages, and use depends on for others.

No. Please follow what Baruch said: use 'select' for BR2_PACKAGE_ZLIB,
BR2_PACKAGE_LUAJIT and BR2_PACKAGE_LIBJSON, and a 'depends on' for
BR2_LINUX_KERNEL.

Also, are you sure sysdig only works with LuaJIT, or does it also work
with the "normal" Lua interpreter?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
