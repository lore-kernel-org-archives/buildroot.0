From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Dec 2019 14:12:17 +0100
Subject: [Buildroot] [PATCH 1/3] package/bubblewrap: new package
In-Reply-To: <20191206012259.GB1574913@momiji> (Adrian Perez de Castro's
 message of "Fri, 6 Dec 2019 01:22:59 +0200")
References: <20190920153106.2274596-1-aperez@igalia.com>
 <20190920153106.2274596-2-aperez@igalia.com>
 <87pnh6puhv.fsf@dell.be.48ers.dk> <20191206012259.GB1574913@momiji>
Message-ID: <87o8wkl1ou.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

Hi,

 >> Committed with these fixes, thanks.

 > \o/

;)

 > I will post a follow patch updating to version 0.4.0 when I manage to get a
 > little bit of spare time, so we can support the package on Musl as well.

Great, thanks.


 >> I wonder what kernel namespacing options are required and/or
 >> recommended? For required options we should add logic in linux/linux.mk
 >> to enable them, and for optional/recommended options it would be good to
 >> mention them in the help text.

 > Mount namespaces are mandatory (I think those cannot be disabled in the kernel
 > config, I'll have to check to be sure), while User, IPC, PID, Network, and UTS
 > namespaces are optional.

Ok. Perhaps we should mention something about that in the help text?


 > Side note: If User namespaces are enabled in the kernel, we could
 > avoid installing the ?bwrap? binary setuid root, is this something
 > desirable?

I believe so, but there is no simple way to detect that at build time,
so the only thing we can do is to add a sub option to install the bwrap
binary suid or not (default to y) with a help text describing the user
namespace dependency.

-- 
Bye, Peter Korsgaard
