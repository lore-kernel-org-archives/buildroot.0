From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri, 30 Mar 2018 22:24:27 +0200
Subject: [Buildroot] [PATCH v4 07/11] package/clang: new host package
In-Reply-To: <CANQCQpb93vS4W3t1sTM_FuJw4d+_wcRFun7V6LqGRPhdwf6dog@mail.gmail.com>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-8-valentin.korenblit@smile.fr>
 <CANQCQpb93vS4W3t1sTM_FuJw4d+_wcRFun7V6LqGRPhdwf6dog@mail.gmail.com>
Message-ID: <e1b3cd83-60ad-6139-6f7b-d7ccd8f3b582@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello Matthew,

On 30/03/2018 18:56, Matthew Weber wrote:
> Valentin,
>
> On Thu, Mar 29, 2018 at 6:33 AM, Valentin Korenblit
> <valentin.korenblit@smile.fr> wrote:
>> This patch provides Clang for the host, tools and libraries.
>>
>> Clang is needed to build libclc, which is also provided in this
>> series.
>>
>> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
>> ---
>>   DEVELOPERS                   |  1 +
>>   package/Config.in.host       |  1 +
>>   package/clang/Config.in.host |  8 ++++++++
>>   package/clang/clang.hash     |  3 +++
>>   package/clang/clang.mk       | 40 ++++++++++++++++++++++++++++++++++++++++
>>   5 files changed, 53 insertions(+)
>>   create mode 100644 package/clang/Config.in.host
>>   create mode 100644 package/clang/clang.hash
>>   create mode 100644 package/clang/clang.mk
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 3ed9407670..47aa2dd82a 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -1859,6 +1859,7 @@ F:        package/dropwatch/
>>   F:     package/tstools/
>>
>>   N:     Valentin Korenblit <valentin.korenblit@smile.fr>
>> +F:     package/clang/
>>   F:     package/llvm/
>>
>>   N:     Vanya Sergeev <vsergeev@gmail.com>
>> diff --git a/package/Config.in.host b/package/Config.in.host
>> index 9a6227174b..09e00a2b45 100644
>> --- a/package/Config.in.host
>> +++ b/package/Config.in.host
>> @@ -5,6 +5,7 @@ menu "Host utilities"
>>          source "package/cargo/Config.in.host"
>>          source "package/cbootimage/Config.in.host"
>>          source "package/checkpolicy/Config.in.host"
>> +       source "package/clang/Config.in.host"
>>          source "package/cmake/Config.in.host"
>>          source "package/cramfs/Config.in.host"
>>          source "package/cryptsetup/Config.in.host"
>> diff --git a/package/clang/Config.in.host b/package/clang/Config.in.host
>> new file mode 100644
>> index 0000000000..61a7ed59f0
>> --- /dev/null
>> +++ b/package/clang/Config.in.host
>> @@ -0,0 +1,8 @@
>> +config BR2_PACKAGE_HOST_CLANG
> When I just select host and target clang, I get the dependency chain error.
>
> Makefile:569: *** llvm is in the dependency chain of clang that has
> added it to its _DEPENDENCIES variable without selecting it or
> depending on it from Config.in.  Stop.

Thanks, I've just added the correct select in Config.in and Config.in.host.

Valentin
