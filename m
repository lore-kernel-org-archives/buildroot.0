From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Oct 2014 22:53:31 -0300
Subject: [Buildroot] [PATCH 1/3] qemu-system: new package
In-Reply-To: <20141019225451.3aa6176e@free-electrons.com>
References: <1399148415-27648-1-git-send-email-gustavo@zacarias.com.ar>	<20141012171752.29414e94@free-electrons.com>	<543AD090.3000107@zacarias.com.ar>	<543EA87A.2050204@mind.be>	<543FCDD6.9070104@zacarias.com.ar>	<54419C9C.7050705@mind.be>	<5441BEDE.1000102@zacarias.com.ar>	<54441E9F.8080802@mind.be>
 <20141019225451.3aa6176e@free-electrons.com>
Message-ID: <54446B1B.2090201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/19/2014 05:54 PM, Thomas Petazzoni wrote:

> On Sun, 19 Oct 2014 22:27:11 +0200, Arnout Vandecappelle wrote:
> 
>>  So what I hear you say is that there really is a case for specifying the
>> qemu-user and qemu-system version separately, and that that's what this whole
>> discussion really is about. And I guess you may want to build at the same time a
>> host-qemu-user of one version and a host-qemu-system of another version, correct?
>>
>>  Still, the .mk file of qemu-user and qemu-system are 90% the same. It would be
>> nice to be able to factor that out somehow. However, it makes complete sense to
>> have them as separate packages first and merge them later.
>>
>>  So the question is: is the need for separate host-qemu-system and
>> host-qemu-user versions more important than the additional complexity of
>> specifying a nearly-identical .mk file twice?
> 
> Despite Gustavo's explanation, I'm not sure to see what is the need to
> have a different version for host-qemu-system and host-qemu-user.
> 
> If a given version of host-qemu-system works for a given
> architecture/platform, then surely, host-qemu-user should work for the
> same architecture. The opposite is obviously not true, but it doesn't
> matter much: we can keep whatever version gets host-qemu-system working.
> 
> Thomas

Arnout: yes, the package .mk could very much share everything that's
common among them yet still be a separate "package"
configuration/parameter-wise.
Thomas: you've got 3 scenarios, the cpu code is broken which won't
matter since both user/system will be broken for a given version, user
code broken which will matter to user only, hardware code broken which
will matter for system only.
Any of those can happen (even everything broken but it's basically the
same as the first option).
And if you're doing user-only for cross configure testing or whatnot
system won't be able to dictate which version you're using since it's a
config option outside of that scope.
To me it seems the decision was taken during the dev days with one-sided
arguments (against), but well life is like that sometimes.
The side effect is that it pushes my motivation to contribute to
buildroot to an all-time low (read that as you wish, in fact it may not
even matter).
Regards.
