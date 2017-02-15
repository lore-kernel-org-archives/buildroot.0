From: Ilias Apalodimas <apalos@gmail.com>
Date: Wed, 15 Feb 2017 10:29:40 +0200
Subject: [Buildroot] [PATCH 2/2] keepalived: new package
In-Reply-To: <20170215082231.vl6wa72kiebgmh65@tarshish>
References: <1487146735-12418-1-git-send-email-apalos@gmail.com>
 <1487146735-12418-2-git-send-email-apalos@gmail.com>
 <20170215082231.vl6wa72kiebgmh65@tarshish>
Message-ID: <CADvJCoeX-zcAz_XpTzUSahr4P3Zv1n0-H73OVH1pHFiXDvL4Tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes you are right,

There is an older patch posted 2 days ago that had the dependencies :(.
I think i messed up one of my diffs.
I'll fix it and report.

On Wed, Feb 15, 2017 at 10:22 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Ilias,
>
> On Wed, Feb 15, 2017 at 10:18:55AM +0200, Ilias Apalodimas wrote:
>> +ifeq ($(BR2_PACKAGE_IPSET),y)
>> +KEEPALIVED_CONF_OPTS += --enable-libipset
>
> You need to add ipset to KEEPALIVED_DEPENDENCIES to make sure it builds before
> keepalived.
>
>> +else
>> +KEEPALIVED_CONF_OPTS += --disable-libipset
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_IPTABLES),y)
>> +KEEPALIVED_CONF_OPTS += --enable-libiptc
>
> Ditto.
>
>> +else
>> +KEEPALIVED_CONF_OPTS += --disable-libiptc
>> +endif
>> +
>> +$(eval $(autotools-package))
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
