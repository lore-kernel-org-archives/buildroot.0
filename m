From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 30 Jan 2016 08:59:02 +0100
Subject: [Buildroot] Xenomai 3.0.1?
In-Reply-To: <20160129093635.3e265ab2@free-electrons.com>
References: <0eb901d159ee$a8a7e900$f9f7bb00$@chordia.co.uk>
 <20160129093635.3e265ab2@free-electrons.com>
Message-ID: <56AC6D46.9090908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29-01-16 09:36, Thomas Petazzoni wrote:
> Hello Jerry,
> 
> On Thu, 28 Jan 2016 17:09:33 -0000, jerry at chordia.co.uk wrote:
>> Running the xenomai prepare-kernel script against an externally sourced
>> 3.18.26 kernel. Buildroot builds a bootable kernel and working FS but the
>> Xenomai userland tools appear to be related to 2.X. 
>>
>> How do I best get BR to install the latest stuff?
> 
> You need to adapt the Xenomai package in package/xenomai/ and also
> probably the Xenomai Linux extension logic in
> linux/linux-ext-xenomai.mk.
> 
> Note however that there is a *big* difference between Xenomai 2 and
> Xenomai 3, and therefore this update is certainly not the easiest
> Buildroot modification that you can imagine. Xenomai 3 can run on top
> of PREEMPT_RT kernels, without the Xenomai co-kernel and Adeos
> interrupt pipeline. This probably requires some fairly significant
> changes in the Xenomai packaging.
> 
> In addition, since Xenomai 3 is rather new and so different from
> Xenomai 2, we probably want to keep support for Xenomai 2 for a while,
> which adds even more challenge to the task.

 Begging to differ here. As far as I know, API-wise, Xenomai 3 is compatible
with Xenomai 2 (except maybe a few deprecated functions that have been removed).
For sure, nothing internal in Buildroot depends on it.

 In addition, running on top of PREEMPT_RT is optional.

 Therefore, I think the bump can be done in the "simple" way first, that there
is no need to offer a Xenomai 2 version, and that a new feature of offering the
single-kernel implementation can be added later.

 Regards,
 Arnout


> 
> In fact, I didn't notice that Xenomai 3 was officially released, last
> time I looked they were at the 3.0-rc stage, so I didn't bother doing
> the Buildroot packaging. I might have a look some day, but that's
> pretty far away on my TODO list, so if someone else wants to look at
> it, it would definitely be great!
> 
> Best regards,
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
