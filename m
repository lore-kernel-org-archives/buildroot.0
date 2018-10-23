From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Oct 2018 19:04:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/postgresql: needs wchar
In-Reply-To: <CAFSsvmqEdPu2V3j=d55j6cUVmNeC0MSjTmA5HM1R5HcWh1LzwA@mail.gmail.com>
References: <20181023160931.16417-1-bernd.kuhls@t-online.de>
 <CAFSsvmqEdPu2V3j=d55j6cUVmNeC0MSjTmA5HM1R5HcWh1LzwA@mail.gmail.com>
Message-ID: <643ca3d2-1825-4707-5fbb-0817229188f9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/23/18 6:25 PM, Adam Duskett wrote:
> Hello;
> On Tue, Oct 23, 2018 at 12:09 PM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
[snip]
>>  config BR2_PACKAGE_PYTHON_PSYCOPG2
>>         bool "python-psycopg2"
>> +       depends on BR2_USE_WCHAR # postgresql
> This isn't needed because python already requires wchar.

 It is not strictly needed, but it is still useful to have it because:

- python or python3 might loose its dependency on wchar at some point;

- its conventient to be able to mechanically patch something like this (even if
not automatic, you can pretty much do propagation without thinking);

- it is convenient to have it there in case we ever add something like e.g. a
script that detects when a reverse dependency is missing.

 So we generally leave it up to the contributor to decide to add such a
redundant dependency.

 Regards,
 Arnout
