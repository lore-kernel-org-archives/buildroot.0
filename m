From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 23:45:45 +0100
Subject: [Buildroot] [PATCH v4] package/python-pillow: new package
In-Reply-To: <20160223233528.4016ea2b@free-electrons.com>
References: <1455962149-29459-1-git-send-email-angelo.compagnucci@gmail.com>
 <20160221152621.52c42acd@free-electrons.com>
 <CA+TH9Vmri=sS5e0gacaoRMxwxNT_evmC9=-ERFvxS86H3NnpKQ@mail.gmail.com>
 <20160223233528.4016ea2b@free-electrons.com>
Message-ID: <56CCE119.2020305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/23/16 23:35, Thomas Petazzoni wrote:
> On Tue, 23 Feb 2016 23:18:47 +0100, Angelo Compagnucci wrote:
> 
>> > Right.
>> > 
>> > I actually implemented something lie this in pkg-python.mk
>> > 
>> > [...]
>> > $(2)_BUILD_TARGET ?= build
>> > [...]
>> > $(2)_BASE_BUILD_TGT   = $$($(2)_BUILD_TARGET)
>> > [...]
>> > 
>> > and seems to work and not breaking other packages.
>> > This way I can add:
>> > 
>> > PYTHON_PILLOW_BUILD_TARGET = build_ext
>> > 
>> > What do you think?
> Since it's the first package to require this, I would rather suggest to
> override PYTHON_PILLOW_BUILD_CMDS in python-pillow.mk, so that this
> hack is limited to this package.
> 
> Should more packages need this in the future, we can add better
> support in the infrastructure.

 Hm, good point as well. Especially because the build commands are just a few lines.

 I notice now that in pkg-python we define _BASE_BUILD_TGT in four different
places, and it's always 'build'. Probably can be removed...


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
