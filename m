From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 09 Jun 2015 00:02:21 +0200
Subject: [Buildroot] [PATCH 02/11] docs/manual: add kernel-module
In-Reply-To: <55760D21.9080107@mind.be>
References: <cover.1433628825.git.yann.morin.1998@free.fr>	<5c16fb51d4dd1fdf8d5660ccc2121895f28ca17c.1433628825.git.yann.morin.1998@free.fr>
 <55760D21.9080107@mind.be>
Message-ID: <557610ED.9060408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/08/15 23:46, Arnout Vandecappelle wrote:
> On 06/07/15 00:20, Yann E. MORIN wrote:
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  docs/manual/adding-packages-kernel-module.txt | 120 ++++++++++++++++++++++++++
>>  docs/manual/adding-packages.txt               |   2 +
>>  2 files changed, 122 insertions(+)
>>  create mode 100644 docs/manual/adding-packages-kernel-module.txt
>>
>> diff --git a/docs/manual/adding-packages-kernel-module.txt b/docs/manual/adding-packages-kernel-module.txt
>> new file mode 100644
>> index 0000000..1fe359a
>> --- /dev/null
>> +++ b/docs/manual/adding-packages-kernel-module.txt
>> @@ -0,0 +1,120 @@
>> +// -*- mode:doc; -*-
>> +// vim: set syntax=asciidoc:
>> +
>> +=== Infrastructure for packages building kernel modules
>> +
>> +Some packages, in addition to the usual user-space components it builds,
>> +may also need to build and install kernel modules.
> 
>  How about:
> 
> Buildroot offers a helper infrastructure to make it easy to write packages that
> build and install Linux kernel modules. Some packages only contain a kernel
> module, other packages contain programs and libraries in addition to kernel
> modules. Buildroot's helper infrastructure supports either case.
> 
>> +
>> +Buildroot offers a helper infrastructure to ease writing such packages.
>> +
>> +[[kernel-module-tutorial]]
>> +==== +kernel-module+ tutorial
>> +
>> +Let's start with an example on how to prepare a simple package that only
>> +builds a kernel module, and no other component:
>> +
>> +----
>> +01: ################################################################################
>> +02: #
>> +03: # foo
>> +04: #
>> +05: ################################################################################
>> +06: 
>> +07: FOO_VERSION = 1.2.3
>> +08: FOO_SOURCE = foo-$(FOO_VERSION).tar.xz
>> +09: FOO_SITE = http://www.foosoftware.org/download

 One more thing: we want to encourage adding license info, so perhaps include in
the example:

FOO_LICENSE = GPLv2
FOO_LICENSE_FILES = COPYING


 Regards,
 Arnout

>> +10: 
>> +11: $(eval $(kernel-module))
>> +12: $(eval $(generic-package))
>> +----
>> +
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
