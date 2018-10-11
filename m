From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Oct 2018 23:11:37 +0200
Subject: [Buildroot] meson for host package with executables doesn't
 work.
In-Reply-To: <CAFr9PXmf0tCQ1u3EstbtRyyJhLxk5Vc1sSOZMXW5qGfNehvLig@mail.gmail.com>
References: <CAFr9PXm1Y=HHy4znDBVdxpd2ndHKdu+_unfgSGHkJFotSZ9HKA@mail.gmail.com>
 <20181011120126.4bb50328@windsurf>
 <CAFr9PXkRORYwg4JF=moZp-e2bhrXLQAamhy-ygzi0ahq8dtgDg@mail.gmail.com>
 <20181011163113.57ef1244@windsurf>
 <CAFr9PXmf0tCQ1u3EstbtRyyJhLxk5Vc1sSOZMXW5qGfNehvLig@mail.gmail.com>
Message-ID: <72e1c646-b6f1-5f1d-e3e3-9ea609fcc5d4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/10/18 17:18, Daniel Palmer wrote:
> Hi,
> 
> I forward ported the patch to the version of meson that is in buildroot now
> and the problem is resolved. I'll submit a patch when I have some time
> over the weekend.

 Upstream claims that the issue is fixed [1][2], so I would prefer to work with
upstream to actually fix the issue upstream. I've commented on the issue (github
doesn't allow reopening).


 Regards,
 Arnout

[1] https://github.com/mesonbuild/meson/issues/314
[2]
https://github.com/mesonbuild/meson/commit/e3757e3d3cf24327c89dd3fc40f6cc933510f676



> 
> Thanks,
> 
> Daniel
> On Thu, 11 Oct 2018 at 23:31, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello,
>>
>> On Thu, 11 Oct 2018 20:42:30 +0900, Daniel Palmer wrote:
>>
>>> Looking through the history in git it looks like this was broken by
>>> commit a03f46ca6e9f43028003aedc92f1a1204ae7480f that bumped the
>>> version of meson and removed a patch that stops meson from stripping
>>> the RPATH on host executables. I guess because there are no packages
>>> in-tree that used it (I couldn't find host-meson-package in any
>>> packages) no one noticed.
>>
>> Indeed, it could very well be due to this. Could you check if re-adding
>> this patch makes things work again ? If it does, please submit a patch
>> re-adding the patch :-)
>>
>> Thanks,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
