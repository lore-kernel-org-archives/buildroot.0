From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Mar 2016 23:49:16 +0100
Subject: [Buildroot] [PATCH 4/4] lxc: remove dependency on headers >= 3.0
In-Reply-To: <20160316233611.6c664973@free-electrons.com>
References: <1458159611-5613-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458159611-5613-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <87twk66onk.fsf@dell.be.48ers.dk>
 <20160316233611.6c664973@free-electrons.com>
Message-ID: <56E9E2EC.9000203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/16/16 23:36, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 16 Mar 2016 23:31:11 +0100, Peter Korsgaard wrote:
>
>> But can missing setns() really just be ignored and still have a working
>> lxc? From the code snippets failures look critical.
>
> Yes, runtime it definitely won't work. But since the LXC code was
> already planning on being able to build on systems not providing those
> syscalls, I was staying in line with this decision.
>
>>  From the man page:
>>
>> VERSIONS
>>
>>          The setns() system call first appeared in Linux in kernel 3.0;
>>          library support was added to glibc in version 2.14.
>>
>> So I think it is safer to just keep the >= 3.0 headers dependency.
>
> But I agree with you, it's probably better to keep the >= 3.0 headers
> dependency. However, the comment that the dependency comes from libcap
> should be changed.

  Well, it would work with old kernel headers, as long as the actual kernel is 
 >= 3.0. But the only use case for that would be when using an old toolchain, 
e.g. Arago. It's probably safer indeed to avoid runtime trouble by just 
depending on the headers version.


  Regards,
  Arnout

>
> Should I change a patch to fix this?
>
> Thanks,
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
