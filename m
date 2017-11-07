From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Nov 2017 10:08:19 +0100
Subject: [Buildroot] [PATCH v2 2/2] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <CANQCQpZekGq2j7d0KJ=gaJSKUe8YBHm-G8QLyTiMJmsdv7r02A@mail.gmail.com>
References: <1508936397-33651-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1508936397-33651-2-git-send-email-matthew.weber@rockwellcollins.com>
 <e29b21b0-6c5f-ef3b-4123-9e8782639f43@mind.be>
 <CANQCQpZ4kVabQPuCNjazZdMB_O-jUxoOFzALR=CKZh5x36pwKQ@mail.gmail.com>
 <CANQCQpZekGq2j7d0KJ=gaJSKUe8YBHm-G8QLyTiMJmsdv7r02A@mail.gmail.com>
Message-ID: <00a38063-e166-6ba4-6927-b90285ce031e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Matt, please snip away some text when replying to a long mail, otherwise it's
difficult to find back your answer in the middle of the long quote.

On 07-11-17 04:25, Matthew Weber wrote:
> Arnout,
> 
> On Mon, Nov 6, 2017 at 6:08 PM, Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>> Arnout,
>>
>> On Mon, Nov 6, 2017 at 3:14 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
[snip]
>>> Do you know how these behave in uClibc and musl? Waldemar, any idea?
>>> Obviously
>>> the gcc part will still be activated, which covers about half of the
>>> functionality.
>>>
>>
>> Checking on the answer, but we ran through the complete test-pkg build list.
>> I'll see which were skipped. We didn't see specific failures.
>>
> 
> The set of test packages I used ended up forcing a glibc only test-pkg
> build.  I'll rerun with a basic busybox scenario.

 It will build, that's for sure. My question is: will it actually do anything
useful? The effect of fortify is shared a bit between GCC and glibc. E.g.
'memset' has a GCC implementation (used when it can be inlined) and a glibc
implementation (used when it's too big or unpredictable). As far as I can see,
neither uClibc nor musl have support for FORTIFY. So only the GCC part will take
effect. But I think that that is so little that it's hardly worth it.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
