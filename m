From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Sep 2013 00:04:04 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
	customization
In-Reply-To: <20130912203359.7e650ebe@skate>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate>
Message-ID: <52323A54.7020808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/09/13 20:33, Thomas Petazzoni wrote:
> Dear ANDY KENNEDY,
>
> On Thu, 12 Sep 2013 18:25:40 +0000, ANDY KENNEDY wrote:
>
>> This sounds much like the way Linux does things for the IP related
>> drivers.  Is that the intent we are going for (personally, I think this
>> is a GREAT idea, as it allows companies to have IP related widgets in
>> BuildRoot without the fear of being REQUIRED to push back their secret
>> sauce)?
>>
>> If that is what you intend, you have my vote!
>
> I am not sure what you mean by "IP related drivers". Do you mean
> proprietary drivers?
>
> It is true that the BR2_EXTERNAL thing raises a licensing question:
> should the BR2_EXTERNAL contents also be released under GPLv2, like the
> rest of Buildroot? Do we really want the root filesystem overlays and
> other highly project-specific contents be released under GPLv2 ?

  You can never be sure unless a judge makes a ruling, but the GPL is 
pretty clear on this:

"If identifiable sections of that work are not derived from the Program,
and can be reasonably considered independent and separate works in
themselves, then this License, and its terms, do not apply to those
sections when you distribute them as separate works."

  i.e. you can distribute the source of buildroot itself separately from 
your external directory.

  GPL continues:

"But when you
distribute the same sections as part of a whole which is a work based
on the Program, the distribution of the whole must be on the terms of
this License, whose permissions for other licensees extend to the
entire whole, and thus to each and every part regardless of who wrote it.

Thus, it is not the intent of this section to claim rights or contest
your rights to work written entirely by you; rather, the intent is to
exercise the right to control the distribution of derivative or
collective works based on the Program.

In addition, mere aggregation of another work not based on the Program
with the Program (or with a work based on the Program) on a volume of
a storage or distribution medium does not bring the other work under
the scope of this License."

  As long as your external stuff merely aggregates with the GPL'd stuff 
under buildroot, there shouldn't be an issue.


  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
