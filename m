From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Sep 2015 23:20:43 +0200
Subject: [Buildroot] [PATCH] libtasn1: bump to version 4.6
In-Reply-To: <87fv2icd1d.fsf@dell.be.48ers.dk>
References: <1442010269-372-1-git-send-email-gustavo@zacarias.com.ar>
 <55F3EFAC.7060306@imgtec.com>
 <20150913121206.64758da8@free-electrons.com>
 <87fv2icd1d.fsf@dell.be.48ers.dk>
Message-ID: <20150913232043.415b5d1a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Sun, 13 Sep 2015 21:52:30 +0200, Peter Korsgaard wrote:

>  > BTW, the fact that you are regularly verifying that the binaries built
>  > by Buildroot are built for MIPS, I am wondering if it wouldn't be worth
>  > the effort to add a final check at the end of the build to verify that
>  > all binaries are built for the proper architecture/ABI. I remember that
>  > some time ago, the nfs-utils package was installing binaries built for
>  > the host machine into the target filesystem.
> 
> Yes, it could be a nice test. How would we do it? With readelf? We would
> need to filter out any shell scripts and similar.

Either readelf, or just "file". But maybe readelf is fine as it's
available in the toolchain. We can skip scripts by testing the first
two bytes of each file and see if they are #!, no?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
