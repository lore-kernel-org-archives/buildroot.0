From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 May 2016 01:48:17 +0200
Subject: [Buildroot] [PATCH v3 0/3] Add go language support
In-Reply-To: <1462564735.27026.32.camel@infradead.org>
References: <cover.1459798147.git.geoff@infradead.org>
 <20160421224301.6a05f711@free-electrons.com>
 <1461965160.27026.9.camel@infradead.org>
 <20160430140314.4ff30ff1@free-electrons.com>
 <1462074238901-b9436b8a-0eb718e2-8f9a915c@mixmax.com>
 <1462207070.27026.20.camel@infradead.org>
 <20160503090857.23f362ea@free-electrons.com>
 <1462564658.27026.31.camel@infradead.org>
 <1462564735.27026.32.camel@infradead.org>
Message-ID: <64ce3a2e-c0ef-7b2f-f54d-2652ad5840a8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/06/16 21:58, Geoff Levand wrote:
> On Fri, 2016-05-06 at 12:57 -0700, Geoff Levand wrote:
>> On Tue, 2016-05-03 at 09:08 +0200, Thomas Petazzoni wrote:
>>> On Mon, 02 May 2016 09:37:50 -0700, Geoff Levand wrote:
>>>
>>>> I have the patch below that adds BR2_TOOLCHAIN_HAS_THREADS.  Is
>>>> it enough to pull in the toolchain?
>>>
>>> No, adding dependencies at the Config.in level doesn't change
>>> anything
>>> in terms of build order.
>>
>> It seems one of these in go-bootstrap.mk should work, is either
>> one prefered?
>>
>>  +HOST_GO_BOOTSTRAP_DEPENDENCIES = host-go-bootstrap
>
> +HOST_GO_BOOTSTRAP_DEPENDENCIES = host-toolchain
>
>>
>>  +HOST_GO_BOOTSTRAP_ADD_TOOLCHAIN_DEPENDENCY = YES

  I don't see how either of these could work... AFAICS, host-toolchain doesn't 
exist, and _ADD_TOOLCHAIN_DEPENDENCY is only checked for target packages.

  What should work however:

HOST_GO_BOOTSTRAP_DEPENDENCIES = toolchain


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
