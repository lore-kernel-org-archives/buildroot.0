From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Jul 2017 11:40:48 +0200
Subject: [Buildroot] [RFC PATCH v5 01/11] package/patchelf: use most
 recent version as a base for rpath sanitation
In-Reply-To: <5b16af39-81af-9a19-dd28-9aebfde9e817@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-2-git-send-email-wg@grandegger.com>
 <80a1cf57-34bb-dc8f-e2b9-dd4001f7df6b@mind.be>
 <5b16af39-81af-9a19-dd28-9aebfde9e817@grandegger.com>
Message-ID: <a30436db-052e-bc75-d727-1147a75da98f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-06-17 19:33, Wolfgang Grandegger wrote:
> Am 30.06.2017 um 19:15 schrieb Arnout Vandecappelle:
>>
>> On 30-06-17 10:36, Wolfgang Grandegger wrote:
>>> We would like to use "patchelf" to do rpath sanitation of all ELF files
>>> in the "host", "staging" and "target" directory, mainly because a script
>>> based solutions is too complex and slow.
>>   Note that the bump is needed because some features were introduced since 0.9
>> that we need for out rpath sanitization.
> OK. Strictly speaking, we don't need/use the new stuff. The patch could also be
> adapted to 0.0. I mainly used the most recent version because of the mainlining
> process.

 Perhaps we should stick to 0.9 then. Since then, they have started using C++11
features, and I am not sure they are supported by the gcc in RHEL5. Since we
will always use patchelf, it will have to be buildable on any host that we
support...

 Adding ThomasDS in Cc who I believe is still using RHEL5. Thomas, can you clone
https://github.com/nixos/patchelf and see if it builds? Perhaps you have to
install gcc44, would that work for you? I've tried to do it myself but I wasn't
able to run a 'yum install' in a CentOs5.6 VM... It seems none of the mirrors
work anymore.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
