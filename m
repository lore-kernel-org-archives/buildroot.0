From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Sep 2015 00:09:05 +0200
Subject: [Buildroot] [PATCH] libtasn1: bump to version 4.6
In-Reply-To: <20150913232043.415b5d1a@free-electrons.com>
References: <1442010269-372-1-git-send-email-gustavo@zacarias.com.ar>
 <55F3EFAC.7060306@imgtec.com> <20150913121206.64758da8@free-electrons.com>
 <87fv2icd1d.fsf@dell.be.48ers.dk>
 <20150913232043.415b5d1a@free-electrons.com>
Message-ID: <55F74581.5070301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-09-15 23:20, Thomas Petazzoni wrote:
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
>>
>> Yes, it could be a nice test. How would we do it? With readelf? We would
>> need to filter out any shell scripts and similar.
> 
> Either readelf, or just "file". But maybe readelf is fine as it's
> available in the toolchain. We can skip scripts by testing the first
> two bytes of each file and see if they are #!, no?

 file has the advantage of also working for scripts, and should even work for
FLAT binaries (which readelf wouldn't like). But it doesn't show the CPU, ISA
and FP details, which are useful to check as well.

 So the perfect approach would be: file, and readelf if file says it's an ELF.

 Or, of course, python-magic and python-pyelftools :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
