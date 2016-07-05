From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 5 Jul 2016 15:43:03 +0200
Subject: [Buildroot] [PATCH 1/4] alljoyn: new package
In-Reply-To: <20c2a9eb-15bb-3049-bae9-329c4ef4a6c9@gmail.com>
References: <20939_1467184224_57737460_20939_8004_1_f44dcc70-6b83-4a10-9e0e-494a4c74c46d@OPEXCLILM5F.corporate.adroot.infra.ftgroup>
 <20c2a9eb-15bb-3049-bae9-329c4ef4a6c9@gmail.com>
Message-ID: <9bfa61de-997d-02e3-dbe7-d58b526f2b8d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 05/07/2016 ? 15:25, Romain Naour a ?crit :
> Hi Fabrice,

>> +++ b/package/alljoyn/Config.in
>> @@ -0,0 +1,18 @@
>> +config BR2_PACKAGE_ALLJOYN
>> +	bool "alljoyn"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	depends on BR2_USE_WCHAR
> 
> I see some fork() function calls in the source code, so alljoyn should depends
> on BR2_USE_MMU
> 
> Also add "depends on BR2_STATIC_LIBS" here (see the last comment)
> 
Obviously I mean "depends on !BR2_STATIC_LIBS"

Best regards,
Romain
