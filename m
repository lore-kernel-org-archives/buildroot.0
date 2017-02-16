From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2017 23:08:17 +0100
Subject: [Buildroot] [PATCH v2] python-lxml: allow build as host package
In-Reply-To: <373030528.10239603.1487071200627.JavaMail.zimbra@datacom.ind.br>
References: <1485179476-6049-1-git-send-email-casantos@datacom.ind.br>
 <1485971468-3709-1-git-send-email-casantos@datacom.ind.br>
 <373030528.10239603.1487071200627.JavaMail.zimbra@datacom.ind.br>
Message-ID: <8c9bf0e5-d389-e61c-efc8-8e75da9bc423@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-02-17 12:20, Carlos Santos wrote:
>> From: "Carlos Santos" <casantos@datacom.ind.br>
>> To: buildroot at buildroot.org
>> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
>> Sent: Wednesday, February 1, 2017 3:51:08 PM
>> Subject: [Buildroot] [PATCH v2] python-lxml: allow build as host package
> 
>> While currently there is no in-tree Buildroot package which depends on
>> host-python-lxml, we (DATACOM) have some proprietary modules that use it
>> in their test scripts.
>>
>> We tested python-lxml as host package and confirmed that it builds and
>> works correctly. Someone else might require it, so we are proposing its
>> inclusion.
> 
> Hello,
> 
> Any news about this proposal? I think it could fall into the new policy of
> "loosen up a little on accepting host tools"[1] if I add the corresponding
> Config.in.host, right? I know I'm pushing here, but host-python-lxml would
> help us (DATACOM) to have more reproducible builds.
> 
> 1. http://elinux.org/Buildroot:DeveloperDaysFOSDEM2017#Host_packages_with_no_in-tree_user

 We didn't reach a satisfactory conclusion for this case. We (or at least I :-)
certainly understand your need. But it is really weird to see a completely
random python package appear in the host tools menu. I personally don't mind
that much, but if all 265 host packages would appear in the menu it would get a
little bit overloaded...

 *Some* way to include it in the autobuilders is certainly needed. As written in
the report: "Maybe for these it's not even so important that they are tested in
the autobuilder - almost nobody is going to use it anyway. However, in that case
it's not very useful to have it anyway. Especially because it almost certainly
will break at some point. "

 So, no clear answer I'm afraid...

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
