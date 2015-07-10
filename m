From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Jul 2015 00:05:30 +0200
Subject: [Buildroot] [PATCH] quagga: disable PIE on ARC
In-Reply-To: <20150710150831.3ff095c8@free-electrons.com>
References: <1436436011-8126-1-git-send-email-abrodkin@synopsys.com>
 <559EE7E6.401@mind.be> <20150710084455.3462000c@free-electrons.com>
 <1436515926.2800.26.camel@synopsys.com> <559F99A1.8060501@mind.be>
 <1436527712.2800.46.camel@synopsys.com> <559FB8AE.7020302@mind.be>
 <20150710150831.3ff095c8@free-electrons.com>
Message-ID: <55A041AA.10608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/10/15 15:08, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Fri, 10 Jul 2015 14:21:02 +0200, Arnout Vandecappelle wrote:
> 
>>  What I mean is that we patch gcc and only support the pie option if that magic
>> environment variable is set.
>>
>>  But looking at the source, that's not going to be easy since the whole command
>> line parsing is abstracted in a way that makes it difficult to hack something
>> like that.
>>
>>  Perhaps another solution is that we disable -pie in the spec file, and pass an
>> alternative spec file which does have pie support in U-Boot:
>>
>> UBOOT_MAKE_OPTS += \
>> 	CC="$(TARGET_CC) -specs=path-to-specfile-with-pie"
> 
> In the end, this seems quite complicated. Not that many packages try to
> build their executables as PIE, so maybe handling that on a per-package
> basis is easier / less hacky.

 Less hacky for sure.

 And at this point probably also easier, since probably most of them have
already been handled.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
