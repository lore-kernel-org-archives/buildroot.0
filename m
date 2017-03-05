From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Mar 2017 23:33:56 +0100
Subject: [Buildroot] [PATCH] odroid-mali: mark package as BROKEN
In-Reply-To: <20170305213723.021d4678@free-electrons.com>
References: <1488638059-6764-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170305213723.021d4678@free-electrons.com>
Message-ID: <b81cad7b-504e-b927-3f62-844925aba881@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-03-17 21:37, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat,  4 Mar 2017 15:34:19 +0100, Thomas Petazzoni wrote:
>> The version of the khrplatform.h header bundled with odroid-mali has a
>> definition of the khronos_intptr_t and khronos_ssize_t that doesn't
>> match the official Khronos registry headers or the Mesa3D headers. Due
>> to this, it causes conflicts with some packages that redefines those
>> types (with the correct definitions), such as libepoxy.
>>
>> Issue reported upstream at: https://github.com/mdrjr/c2_mali/issues/1
>>
>> Since nobody bothered fixing the issue even though it has been happening
>> since July 2016 (first build failure at
>> http://autobuild.buildroot.net/results/ed8d562ae5fdb472a83f9a07b2f755c80c972c34/),
>> let's mark this package as BROKEN.
>>
>> Fixes:
>>
>>   http://autobuild.buildroot.net/results/ca48bb6291ca16e410edb83b5cdeb24847b6eaee/
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>>  package/odroid-mali/Config.in | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
> 
> Applied to master, thanks.

 I'm obviously late with commenting on this, but I think marking things as
BROKEN is wrong. It bypasses the legacy mechanism so it disappears without
notice. Also, BROKEN packages languish there for years without ever anyone
taking a look. Sometimes things do get repaired, but re-adding the package is
not much more complicated than

 So, I propose to remove all broken packages.

 [I have the feeling we discussed this kind of thing at some BR devel meeting at
some point, but I can't find it.]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
