From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 23:36:36 +0100
Subject: [Buildroot] [PATCH v4] package/python-pillow: new package
In-Reply-To: <CA+TH9Vmri=sS5e0gacaoRMxwxNT_evmC9=-ERFvxS86H3NnpKQ@mail.gmail.com>
References: <1455962149-29459-1-git-send-email-angelo.compagnucci@gmail.com>
 <20160221152621.52c42acd@free-electrons.com>
 <CA+TH9Vmri=sS5e0gacaoRMxwxNT_evmC9=-ERFvxS86H3NnpKQ@mail.gmail.com>
Message-ID: <56CCDEF4.9050803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/23/16 23:18, Angelo Compagnucci wrote:
> Dear Thomas Petazzoni,
> 
> 2016-02-21 15:26 GMT+01:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
[snip]
>> It seems like you should pass explicit --enable/--disable options,
>> since at least jpeg and zlib are by default expected to be enabled.
>> See https://pillow.readthedocs.org/en/latest/installation.html#external-libraries.
>>
>> Unfortunately, those options are only recognized when calling "setup.py
>> build_ext", not when calling "setup.py build" as the python-package
>> infrastructure is doing. So you might need to override the build
>> commands for this package.
> 
> Right.
> 
> I actually implemented something lie this in pkg-python.mk
> 
> [...]
> $(2)_BUILD_TARGET ?= build
> [...]
> $(2)_BASE_BUILD_TGT   = $$($(2)_BUILD_TARGET)
> [...]
> 
> and seems to work and not breaking other packages.
> This way I can add:
> 
> PYTHON_PILLOW_BUILD_TARGET = build_ext
> 
> What do you think?

 Looks like a good idea to me - parallel with autotools-package.

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
