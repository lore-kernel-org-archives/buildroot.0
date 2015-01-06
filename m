From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 6 Jan 2015 23:22:21 +0100
Subject: [Buildroot] [PATCH v3] python-tornado: bump to 4.0.2
In-Reply-To: <20150106220103.1fe958ad@free-electrons.com>
References: <1420477207-14637-1-git-send-email-yegorslists@googlemail.com>
 <20150106220103.1fe958ad@free-electrons.com>
Message-ID: <CAGm1_kuaK7WHDWS8iHdOg=59kzUfY81gka4C2aip0rLS_bh-Pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 6, 2015 at 10:01 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yegor Yefremov,
>
> On Mon,  5 Jan 2015 18:00:07 +0100, Yegor Yefremov wrote:
>
>> diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
>> index 870a3de..9bbfc55 100644
>> --- a/package/python-tornado/Config.in
>> +++ b/package/python-tornado/Config.in
>> @@ -1,7 +1,10 @@
>>  config BR2_PACKAGE_PYTHON_TORNADO
>>       bool "python-tornado"
>> -     depends on BR2_PACKAGE_PYTHON
>> -     select BR2_PACKAGE_PYTHON_ZLIB
>> +     select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
>> +     select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
>> +     select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
>> +     select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
>> +     select BR2_PACKAGE_PYTHON_CERTIFI # runtime
>
> Are you sure SSL and certifi are mandatory dependencies? I see the
> following things in the source code:
>
> try:
>     import ssl
> except ImportError:
>     # ssl is not available on Google App Engine.
>     ssl = None
>
> try:
>     import certifi
> except ImportError:
>     certifi = None
>
> Which seem to indicate that those Python packages are not mandatory for
> python-tornado. They are only needed if you want to do https://
> connexions, no?

SSL was really needed by the current version 3.1.1, but this
dependency was missing. But you're right tornado devs have fixed this.
I'll remove them both then.

>> +# Locally computed:
>> +sha1    6152ea61b4cdf9566f3974f30603ff51b527dd87                          tornado-4.0.2.tar.gz
>> +sha256  900c5124ebdb6598ca8e8a0c5888f41a5f14117952d5515258e3d20222b21bfa  tornado-4.0.2.tar.gz
>
> sha256 is sufficient, no need to have sha1 in addition to it.

Will remove too.

Yegor
