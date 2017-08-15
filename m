From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Aug 2017 16:53:18 +0200
Subject: [Buildroot] [PATCH] Revert "syslinux: drop patch 0003,
 not needed after gnu-efi update"
In-Reply-To: <20170814220953.45dcf706@windsurf>
References: <20170813232835.18414-1-arnout@mind.be>
 <20170814220953.45dcf706@windsurf>
Message-ID: <f662424e-3bc1-b799-9008-8fa84c79a40b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-08-17 22:09, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 14 Aug 2017 01:28:35 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> It turns out that this patch is still needed, since with some versions
>> of binutils the error still occurs.
>>
>> Partially fixes: https://gitlab.com/arnout/buildroot/-/jobs/28979377
>>
>> This reverts commit 644c024edeb7e20bd96ce4426aeca2cbcd74d9b9.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Cc: Beno?t Allard <benoit.allard@greenbone.net>
>> ---
>> The failing ts5x00_defconfig also requires a kernel bump
> 
> The problem with this is that you are going to run into the problem I
> reported at:
> http://lists.busybox.net/pipermail/buildroot/2017-July/195927.html, i.e
> the --no-dynamic-linker option doesn't exist in old binutils versions,
> and will therefore cause a build failure.

 Indeed, TestIso9660Syslinux{Ex,Int}ternal fail on it.

 I'm now trying with --omagic --no-omagic instead. If I read the man page
correctly, this should have more or less the same effect. It feels like a huge
hack though...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
