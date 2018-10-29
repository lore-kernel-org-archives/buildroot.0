From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 29 Oct 2018 12:34:20 -0200 (BRST)
Subject: [Buildroot] [PATCH v3] eudev: generate hwdb.bin at system
 startup
In-Reply-To: <CANQCQpaL2yFSbc9o8YpP9Jd2gZ9ybioByL_UwKhgvYRj-HkPjQ@mail.gmail.com>
References: <20181016170157.14348-1-casantos@datacom.com.br>
 <CANQCQpaL2yFSbc9o8YpP9Jd2gZ9ybioByL_UwKhgvYRj-HkPjQ@mail.gmail.com>
Message-ID: <2093934924.5380192.1540823660383.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Matthew Weber" <matthew.weber@rockwellcollins.com>
> To: "DATACOM" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "Bernd Kuhls" <bernd.kuhls@t-online.de>, "Eric Le Bihan"
> <eric.le.bihan.dev@free.fr>, "Yann Morin" <yann.morin.1998@free.fr>, "Carlos Santos" <casantos@datacom.ind.br>
> Sent: Monday, October 29, 2018 11:11:17 AM
> Subject: Re: [PATCH v3] eudev: generate hwdb.bin at system startup

> Carlos,
> 
> On Tue, Oct 16, 2018 at 12:02 PM Carlos Santos <casantos@datacom.com.br> wrote:
>>
>> From: Carlos Santos <casantos@datacom.ind.br>
[...]
>>  ifeq ($(BR2_PACKAGE_EUDEV_ENABLE_HWDB),y)
>>  EUDEV_CONF_OPTS += --enable-hwdb
>> +define EUDEV_POST_PATCH
>> +       $(SED)
>> 's,$${udevconfdir}/hwdb.bin,$${udevhwdbbinpath:-$${udevconfdir}/hwdb.bin},' \
>> +               $(@D)/configure
>> +endef
>> +EUDEV_POST_PATCH_HOOKS += EUDEV_POST_PATCH
>> +EUDEV_CONF_ENV += udevhwdbbinpath=$(BR2_PACKAGE_EUDEV_HWDB_BIN_PATH)
> 
> I believe BR2_PACKAGE_EUDEV_HWDB_BIN_PATH needs a qstrip?

Not really, since the quotes are properly handled and may even be even
required in the unlikely situation of BR2_PACKAGE_EUDEV_HWDB_BIN_PATH
containing white spaces.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
