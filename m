From: Julien Floret <julien.floret@6wind.com>
Date: Tue, 12 Sep 2017 10:48:10 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: install all MIB files
In-Reply-To: <8d8bb3d5-6ea9-94b4-1a53-a57909b8bbc6@mind.be>
References: <20170908134548.23645-1-julien.floret@6wind.com>
 <8d8bb3d5-6ea9-94b4-1a53-a57909b8bbc6@mind.be>
Message-ID: <CAHfJR7jjCn8FdGqhKOq=7_pAgwObLNSQUdzzdbzOi+ijyvJLCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

2017-09-12 1:08 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>
>
> On 08-09-17 15:45, Julien Floret wrote:
>> Since commit be8e32d585f3 ("netsnmp: configurable MIB modules"),
>> the list of MIB modules can be selected with a configuration option.
>>
>> However, there was still an hardcoded list of MIB files to exclude from
>> the target filesystem.
>> Since it is complicated to know which MIB files are necessary according
>> to the configuration, let's install all of them.
>>
>> Cc: przemyslaw <przemyslaw.wrzos@calyptech.com>
>> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
>> Signed-off-by: Julien Floret <julien.floret@6wind.com>
>
>  Looks good to me, except: shouldn't the default of
> BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES so that all the previous BLOAT_MIBS are
> there?

Hum, maybe we could parse
BR2_PACKAGE_NETSNMP_{WITH,WITHOUT}_MIB_MODULES to deduce BLOAT_MIBS,
but to me it does not seem trivial nor elegant...
What about adding a new config option BR2_NETSNMP_WITHOUT_MIB_FILES
whose default value is the content of BLOAT_MIBS?
