From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 Mar 2013 16:27:06 +0100
Subject: [Buildroot] [PATCH 4/4] Enable feature CONFIG_FEATURE_PIDFILE
 so that the syslog initscript actually works
In-Reply-To: <51545AD6.5050307@arved.at>
References: <1364222893-23858-1-git-send-email-arved@arved.at>
 <1364222893-23858-4-git-send-email-arved@arved.at> <5153ED66.3090001@mind.be>
 <51545AD6.5050307@arved.at>
Message-ID: <5154614A.6030806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/03/13 15:59, Tilman Keskin?z wrote:
> Hi Arnout,
>
> * Arnout Vandecappelle [Thu, 28 Mar 2013 08:12:38 +0100]:
>>> -# CONFIG_FEATURE_PIDFILE is not set
>>> +CONFIG_FEATURE_PIDFILE=y
>>
>>   Since we care very much about the size of busybox, could you evaluate
>> what the size difference is before and after this change?  One smallish
>> architecture (e.g. ARM) is enough.
>>
>>   Could you also make this change to the other busybox versions as well?
>> The different busybox configs should only differ because of features
>> added/removed in that particular version.
>
> On ARM the difference is 64 Bytes. (gcc 4.6.x)

  Great, then it is a good idea to enable it by default. Can you do it 
for all busybox versions?

  Question to the list: do we really need to keep several busybox 
versions? For U-Boot or kernel it may make some kind of sense, because 
you have custom patches on top of a specific version. But for busybox?


> If you don't want to enable this feature, another option would be to use
> start-stop-daemon -p in the syslog init script.

  It is already using the -p option, no?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
