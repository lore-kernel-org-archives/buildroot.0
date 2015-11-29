From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Nov 2015 13:10:13 +0100
Subject: [Buildroot] [PATCH 2/2] unzip: new package
In-Reply-To: <5658DD1D.6060506@openwide.fr>
References: <1448645881-32202-1-git-send-email-luca@lucaceresoli.net>
 <1448645881-32202-2-git-send-email-luca@lucaceresoli.net>
 <5658DD1D.6060506@openwide.fr>
Message-ID: <565AEB25.7070605@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain,

Romain Naour wrote:
[...]
>> diff --git a/package/unzip/Config.in b/package/unzip/Config.in
>> new file mode 100644
>> index 0000000..0d98d28
>> --- /dev/null
>> +++ b/package/unzip/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_UNZIP
>> +	bool "unzip"
>
> Have you checked some toolchain dependencies ?
> It seems that process.c use wchar_t so "depends on BR2_USE_WCHAR" is needed.

The CMakeLists.txt that I wrote does never define UNICODE_SUPPORT nor
UNICODE_WCHAR. So it builds both with and without wchar support, but
never uses it. I would like to have a basic package working,
conditional support can be added later at any time.

-- 
Luca
