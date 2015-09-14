From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 14 Sep 2015 09:49:13 +0100
Subject: [Buildroot] [PATCH] libtasn1: bump to version 4.6
In-Reply-To: <20150913232043.415b5d1a@free-electrons.com>
References: <1442010269-372-1-git-send-email-gustavo@zacarias.com.ar>
 <55F3EFAC.7060306@imgtec.com> <20150913121206.64758da8@free-electrons.com>
 <87fv2icd1d.fsf@dell.be.48ers.dk>
 <20150913232043.415b5d1a@free-electrons.com>
Message-ID: <55F68A09.2020204@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 09/13/2015 10:20 PM, Thomas Petazzoni wrote:
> Peter,
> 
> On Sun, 13 Sep 2015 21:52:30 +0200, Peter Korsgaard wrote:
> 
>>  > BTW, the fact that you are regularly verifying that the binaries built
>>  > by Buildroot are built for MIPS, I am wondering if it wouldn't be worth
>>  > the effort to add a final check at the end of the build to verify that
>>  > all binaries are built for the proper architecture/ABI. I remember that
>>  > some time ago, the nfs-utils package was installing binaries built for
>>  > the host machine into the target filesystem.

It's a good idea.

>> Yes, it could be a nice test. How would we do it? With readelf? We would
>> need to filter out any shell scripts and similar.
> 
> Either readelf, or just "file". But maybe readelf is fine as it's
> available in the toolchain. We can skip scripts by testing the first
> two bytes of each file and see if they are #!, no?

Or use "file -i" and grep for "charset=binary".

Also, your script to calculate the size of the rootfs is a good start
point since it already collects all the files in target :-) We could
reuse part of that code, or directly use the .txt file that it generates.

Regards,

Vincent.

> Best regards,
> 
> Thomas
> 
