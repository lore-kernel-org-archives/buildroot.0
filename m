From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Aug 2017 00:48:10 +0200
Subject: [Buildroot] Analysis of build results for 2017-08-14
In-Reply-To: <20170816225324.331fec56@windsurf>
References: <20170815063102.ED3612091A@mail.free-electrons.com>
 <20170815142032.329e8103@windsurf>
 <865c6d16-fd88-294e-2fea-62cf312fbacb@mind.be>
 <20170816225324.331fec56@windsurf>
Message-ID: <9a1b8d71-d39b-dc8b-fa95-dbeb6f1213b4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-08-17 22:53, Thomas Petazzoni wrote:
>>>>       x86_64 |                     ruby-2.4.1 | NOK | http://autobuild.buildroot.net/results/8f0342b7b88df979a59fdab574b2489628d7ffa5 | ORPH  
>>> Not sure what's happening here:
>>>
>>> linking shared-library libruby.so.2.4.1
>>> libruby.so.2.4.1: final close failed: Invalid operation
>>> collect2: error: ld returned 1 exit status
>>>
>>> Anyone to look into this ?  
>>  Perhaps an instance of https://sourceware.org/bugzilla/show_bug.cgi?id=20006 ?
>> Not sure if that patch has been applied to the sourcery toolchain - it should
>> be, since the binutils 2.26 fix was committed in April 2016 and the toolchain is
>> from November, but it's hard to be sure.
> If you look at http://autobuild.buildroot.net/?reason=ruby-2.4.1, this
> issue only appeared two times: in July 2017 and August 2017. This
> Sourcery toolchain has been around for much longer, and was last bumped
> in December 2016.

 As another point of reference: it didn't occur for ruby-2.4.0.

> So if it was just the Sourcery toolchain being unable to build
> ruby-2.4.1, I think we would have a lot more failures than that. So it
> might be a toolchain issue, but that occurs under very specific
> conditions.

 ruby has a bunch of optional dependencies, so yes indeed it only occurs for
some exotic combination of these dependencies.

 So I checked the source of the Sourcery toolchain and it does NOT have the
patch of bug 20006 applied, even though it was released in binutils 2.26.1, 4
months before the Sourcery release...

 So, we could try to find out which exact combination of packages triggers this
issue, but is that worth it for something that happens twice in five months...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
