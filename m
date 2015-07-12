From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Jul 2015 01:44:31 +0200
Subject: [Buildroot] [PATCH 2/7] package/linux: don't enforce check for
 DTS when not building
In-Reply-To: <20150712200309.GB2451@tarshish>
References: <cover.1436702899.git.yann.morin.1998@free.fr>
 <ff5a9ea519a5c72dd917369e6409674b9d4a340f.1436702899.git.yann.morin.1998@free.fr>
 <20150712200309.GB2451@tarshish>
Message-ID: <55A2FBDF.9070808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/12/15 22:03, Baruch Siach wrote:
> Hi Yann,
> 
> On Sun, Jul 12, 2015 at 02:11:24PM +0200, Yann E. MORIN wrote:
>> Currently, this is triggering the error message:
>>     make randconfig
>>     make source
>>
>> Limit the checks that enforce a DTS is set and at most one DTB is
>> appended to when we are actually building, like is done for the
>> configuration-file variables.
>>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> [snip]
> 
>> -ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
>> +ifeq ($(BR_BUILDING)$(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),yy)
> 
> yy means that exactly two of these must be 'y'. Is that intended?

 Yes it is, because KERNEL_DTS_NAME is a string, not a boolean, so it
essentially checks that it is empty and DTS_SUPPORT is selected. But admittedly
it's not very transparent, it would make sense to add delimiters in-between at
least.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
