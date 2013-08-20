From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Aug 2013 19:35:18 +0200
Subject: [Buildroot] [PATCH v2 0/3] Fix for top-level parallel make part
 1
In-Reply-To: <CAHkwnC83NuBakitgdOF44XOJPKueSfb5gYWeHbpSWJKJqCkKkg@mail.gmail.com>
References: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
 <20130718113809.663c6b58@skate>
 <CAHkwnC8imHc+yWdkUeR6VdehBhpuux_xmKProHu7uFmmR50N8g@mail.gmail.com>
 <20130727131828.0442e227@skate>
 <CAHkwnC-yTeGXQnh64-Ra_TJg4ysYqAPNsNaWhA=_sgiUm5R5bw@mail.gmail.com>
 <20130730120157.0d32a58b@skate>
 <CAHkwnC8SV6L=4a0ain-VysEw3Z8Jg_XLLUJWH1xo6T=FVeYO6A@mail.gmail.com>
 <20130730132901.0682e15d@skate> <520911F3.1020704@mind.be>
 <CAHkwnC83NuBakitgdOF44XOJPKueSfb5gYWeHbpSWJKJqCkKkg@mail.gmail.com>
Message-ID: <5213A8D6.3080802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/08/13 14:14, Fabio Porcedda wrote:
> On Mon, Aug 12, 2013 at 6:48 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 30/07/13 13:29, Thomas Petazzoni wrote:
>>>
>>> I'd really like to see top-level parallel build in Buildroot, but I
>>> don't think we should do it at the expense of build reproducibility and
>>> increase of users support complexity.
>>
>>
>>   That said, I would say that any patch that improves the top-level parallel
>> build situation should be accepted, unless it really adds complexity. So 1/3
>> would definitely be acceptable IMHO.
>>
>>   I also think that 2/3 and 3/3 clarify the generic infrastructure, so I'd
>> accept them as well. Only, they also changes the behaviour when you touch a
>> .stamp file, so it requires a bit more thinking.
>>
>>
>
> Hi Arnout,
> thanks for reviewing.
>
> I obviously approve the idea of accepting patches that improve
> top-level parallel make and does not add complexity, such as these
> patches.
>
> You are right that 2/3 and 3/3 change the behaviour when you touch
> .stamp file, but i think that the touching of .stamp file for the
> -extract and -patch targets does not happen using buildroot targets,
> the touching of those .stamp files can happen only manually, so IMHO
> it's not a real problem.

  Ah that's right, the order changed a while ago and now the -depends 
come after -patch. It used to be different though.

  So I guess that 2/3 and 3/3 should be acceptable as well. After a bit 
of testing and a formal Ack, of course.

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
