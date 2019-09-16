From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 16 Sep 2019 06:26:52 -0700
Subject: [Buildroot] [PATCH 1/5] package/mariadb: use host-openssl from
 buildroot-system
In-Reply-To: <20190915220057.5f78f039@windsurf.home>
References: <20190915193559.8464-1-bluemrp9@gmail.com>
 <20190915220057.5f78f039@windsurf.home>
Message-ID: <7ee1299a-c931-2abd-62cc-e96c0dd7c105@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, All,

On 9/15/2019 1:00 PM, Thomas Petazzoni wrote:
> Hello Ryan,
>
> On Sun, 15 Sep 2019 12:35:55 -0700
> Ryan Coe <bluemrp9@gmail.com> wrote:
>
>> From: Peter Seiderer <ps.report@gmx.net>
>>
>> - change WITH_SSL for host build from bundled to system (and add
>>    host-openssl dependency) to avoid the following configure failure:
>>
>>    CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
>>      Could NOT find GnuTLS (missing: GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR)
>>      (Required is at least version "3.3.24")
>>    Call Stack (most recent call first):
>>      /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
>>      /usr/share/cmake/Modules/FindGnuTLS.cmake:54 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
>>      libmariadb/CMakeLists.txt:298 (FIND_PACKAGE)
> We're not getting any build failures about mariadb. Under what
> conditions/configurations does the above error take place ?
>
>> -HOST_MARIADB_CONF_OPTS += -DWITH_SSL=OFF
> This says "SSL=OFF", not "use bundled SSL". Could you clarify ?
MariaDB isn't built with the autobuilders.? Upstream no longer allows 
-DWITH_SSL=OFF as a configure option.? It will fail if it doesn't find 
host OpenSSL or GnuTLS headers.? The patch text should probably say 
"from off to system".? This patch was sent by Peter after the 10.3 bump 
but was never merged.? Thanks.
> Thanks,
>
> Thomas
