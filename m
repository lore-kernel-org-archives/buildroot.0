From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 3 Dec 2017 18:48:47 +0100
Subject: [Buildroot] [PATCH 1/1] check-package: avoid false warning of
 useless flag
In-Reply-To: <20171202150809.1140da1b@windsurf.lan>
References: <d2844704851e4e8ff93c3007e9e67e2a339e11c7.1511996903.git.yann.morin.1998@free.fr>
 <1512188904-31366-1-git-send-email-ricardo.martincoski@datacom.ind.br>
 <20171202110320.GA2988@scaer> <20171202141059.391df6c0@windsurf.lan>
 <20171202135443.GB2988@scaer> <20171202150809.1140da1b@windsurf.lan>
Message-ID: <cb7f50ed-713d-1565-8f34-928b6eeb0224@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-12-17 15:08, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 2 Dec 2017 14:54:43 +0100, Yann E. MORIN wrote:
> 
>> OK, but then with this change, we will now be missing actual errors,
>> e.g.:
>>
>>     FOO_AUTORECONF = NO
>>     HOST_FOO_AUTORECONF = NO
>>
>> Will not report the host vairant as bogus, even after the target variant
>> gets removed.
>>
>> So we lose a false positive for a false negative.
> 
> Yes, it was already mentioned by Ricardo in the discussion.
> 
>> I have to admit I am not sure which is worse/best...
> 
> Checking tools that have false positives are unusable, because they
> create some noise that always make you think "gaah, it must be the tool
> again complaining about something that doesn't make sense".
> 
> So I very much prefer a tool that doesn't report false positives, and
> for which the results can be trusted. This way, we are much more likely
> to pay attention to the tool results, and keep in a good shape what the
> tool is checking today.

 +1 to that.

 Regards,
 Arnout

> 
> And that doesn't prevent, in parallel, from improving the tool to
> detect other problems.
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
